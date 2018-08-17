module ApplicationHelper
    def category_cloud(categories, classes)
        max = categories.sort_by(&:count).last
        categories.each do |category|
            index = category.count.to_f / max.count * (classes.size - 1)
            yield(category, classes[index.round])
        end
    end
end
