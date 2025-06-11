//
//  TagGridView.swift
//  RestaurantuntsExplorer
//
//  Created by poonam on 10/06/25.
//

import SwiftUI
struct TagGridView: View {
    let tags : [String]
    var body: some View {
        ScrollView { 
            // Use ScrollView if the content might exceed screen height
            FlowLayout(horizontalSpacing: 10, verticalSpacing: 12) {
                // Iterate over the tags array to create a view for each tag.
                ForEach(tags, id: \.self) { tag in
                    TagView(text: tag, background: Color("tagBackGrey"), forground: Color("grey4f4f"), fontSize: 12)
                }
            }
            
        }
    }
}
struct FlowLayout: Layout {
    // Configuration properties for the layout.
    var horizontalSpacing: CGFloat
    var verticalSpacing: CGFloat
    // Caching helps improve performance by avoiding redundant calculations.
    struct Cache {
        var sizes: [CGSize] = []
        var rows: [[LayoutSubviews.Element]] = []
    }
    // This method is called by SwiftUI to ask for the cache instance.
    func makeCache(subviews: Subviews) -> Cache {
        // We pre-calculate the sizes of all subviews here.
        let sizes = subviews.map { $0.sizeThatFits(.unspecified) }
        var cache = Cache()
        cache.sizes = sizes
        return cache
    }
    // Calculates and returns the total size of the container.
    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout Cache
    ) -> CGSize {
        // If there are no subviews, the size is zero.
        guard !subviews.isEmpty else { return .zero }
        // Arrange the subviews into rows based on the available width.
        let rows = arrangeRows(proposal: proposal, subviews: subviews, cache: &cache)
        // Calculate the total height of all rows combined.
        let totalHeight = rows.reduce(0) { partialResult, row in
            // Find the height of the tallest view in the current row.
            let rowHeight = row.map { $0.sizeThatFits(.unspecified).height }.max() ?? 0
            // Add the row height and vertical spacing to the total.
            return partialResult + rowHeight + verticalSpacing
        }
        // We subtract the last vertical spacing as it's not needed after the last row.
        return CGSize(width: proposal.width ?? 0, height: totalHeight - verticalSpacing)
    }
    // Places all the subviews in their correct positions within the container.
    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout Cache
    ) {
        // Make sure we have rows to place.
        // If not, calculate them first.
        if cache.rows.isEmpty {
            cache.rows = arrangeRows(proposal: proposal, subviews: subviews, cache: &cache)
        }
        
        // Starting coordinates for placing views.
        // We use the bounds' origin as the starting point.
        var origin = bounds.origin
        
        // Iterate over each row to place the views.
        for row in cache.rows {
            // Find the height of the tallest view in this row.
            let rowHeight = row.map { $0.sizeThatFits(.unspecified).height }.max() ?? 0
            
            // Reset the horizontal position for the new row.
            origin.x = bounds.origin.x
            
            // Iterate over each view within the row.
            for view in row {
                // Get the pre-calculated size of the view.
                let viewSize = view.sizeThatFits(.unspecified)
                // We use a proposal with the exact size to ensure it's placed correctly.
                view.place(at: origin, proposal: ProposedViewSize(viewSize))
                
                // Move the horizontal origin for the next view in the row.
                origin.x += viewSize.width + horizontalSpacing
            }
            
            // Move the vertical origin down for the next row.
            origin.y += rowHeight + verticalSpacing
        }
    }
    
    // A helper function to arrange subviews into rows that fit the proposed width.
    private func arrangeRows(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout Cache
    ) -> [[LayoutSubviews.Element]] {
        
        var rows: [[LayoutSubviews.Element]] = []
        var currentRow: [LayoutSubviews.Element] = []
        var currentRowWidth: CGFloat = 0
        
        // Get the available width from the proposal, defaulting to infinity if not specified.
        let availableWidth = proposal.width ?? .infinity
        
        // Iterate over the subviews and their cached sizes.
        for (index, view) in subviews.enumerated() {
            let viewSize = cache.sizes[index]
            
            // Check if adding the next view exceeds the available width.
            if currentRowWidth + viewSize.width + horizontalSpacing > availableWidth && !currentRow.isEmpty {
                // The current row is full. Add it to our list of rows.
                rows.append(currentRow)
                // Start a new row.
                currentRow = []
                currentRowWidth = 0
            }
            
            // Add the view to the current row.
            currentRow.append(view)
            // Update the width of the current row.
            currentRowWidth += viewSize.width + horizontalSpacing
        }
        
        // Append the last row if it's not empty.
        if !currentRow.isEmpty {
            rows.append(currentRow)
        }
        
        return rows
    }
}


#Preview {
    TagGridView(tags: ["Smart Casual", "Good for Dinner", "Accepts Credit Cards cash", "Accepts Cash"])
}
