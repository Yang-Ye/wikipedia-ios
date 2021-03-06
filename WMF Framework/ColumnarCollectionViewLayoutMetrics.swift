public struct ColumnarCollectionViewLayoutMetrics {
    public static let defaultItemLayoutMargins = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    let boundsSize: CGSize
    let layoutMargins: UIEdgeInsets
    let countOfColumns: Int
    let itemLayoutMargins: UIEdgeInsets
    let readableWidth: CGFloat
    let interSectionSpacing: CGFloat
    let interColumnSpacing: CGFloat
    let interItemSpacing: CGFloat
    var shouldMatchColumnHeights = false
    
    public static func exploreViewMetrics(with boundsSize: CGSize, readableWidth: CGFloat, layoutMargins: UIEdgeInsets) -> ColumnarCollectionViewLayoutMetrics {
        let useTwoColumns = boundsSize.width >= 600 || (boundsSize.width > boundsSize.height && readableWidth >= 500)
        let countOfColumns = useTwoColumns ? 2 : 1
        let interColumnSpacing: CGFloat = useTwoColumns ? 10 : 0
        let interItemSpacing: CGFloat = 20
        let interSectionSpacing: CGFloat = useTwoColumns ? 20 : 0
        
        let layoutMarginsForMetrics: UIEdgeInsets
        if useTwoColumns {
            let marginWidth = max(max(layoutMargins.left, layoutMargins.right), round(0.5 * (boundsSize.width - (readableWidth * CGFloat(countOfColumns)))))
            layoutMarginsForMetrics = UIEdgeInsetsMake(20, marginWidth, 20, marginWidth)
        } else {
            let marginWidth = max(layoutMargins.left, layoutMargins.right)
            layoutMarginsForMetrics = UIEdgeInsetsMake(0, marginWidth, 0, marginWidth)
        }
        
        let itemLayoutMargins = ColumnarCollectionViewLayoutMetrics.defaultItemLayoutMargins
        return ColumnarCollectionViewLayoutMetrics(boundsSize: boundsSize, layoutMargins: layoutMarginsForMetrics, countOfColumns: countOfColumns, itemLayoutMargins: itemLayoutMargins, readableWidth: readableWidth, interSectionSpacing: interSectionSpacing, interColumnSpacing: interColumnSpacing, interItemSpacing: interItemSpacing, shouldMatchColumnHeights: false)
    }
    
    
    public static func tableViewMetrics(with boundsSize: CGSize, readableWidth: CGFloat, layoutMargins: UIEdgeInsets, interSectionSpacing: CGFloat = 0, interItemSpacing: CGFloat  = 0) -> ColumnarCollectionViewLayoutMetrics {
        let marginWidth = max(max(layoutMargins.left, layoutMargins.right), round(0.5 * (boundsSize.width - readableWidth)))
        var itemLayoutMargins = ColumnarCollectionViewLayoutMetrics.defaultItemLayoutMargins
        itemLayoutMargins.left = max(marginWidth, itemLayoutMargins.left)
        itemLayoutMargins.right = max(marginWidth, itemLayoutMargins.right)
        return ColumnarCollectionViewLayoutMetrics(boundsSize: boundsSize, layoutMargins: .zero, countOfColumns: 1, itemLayoutMargins: itemLayoutMargins, readableWidth: readableWidth, interSectionSpacing: 0, interColumnSpacing: 0,  interItemSpacing: 0, shouldMatchColumnHeights: false)
    }
    
    public static func exploreCardMetrics(with boundsSize: CGSize, readableWidth: CGFloat, layoutMargins: UIEdgeInsets) -> ColumnarCollectionViewLayoutMetrics {
        let itemLayoutMargins = ColumnarCollectionViewLayoutMetrics.defaultItemLayoutMargins
        return ColumnarCollectionViewLayoutMetrics(boundsSize: boundsSize, layoutMargins: layoutMargins, countOfColumns: 1, itemLayoutMargins: itemLayoutMargins, readableWidth: readableWidth, interSectionSpacing: 0, interColumnSpacing: 0,  interItemSpacing: 0, shouldMatchColumnHeights: false)
    }
}
