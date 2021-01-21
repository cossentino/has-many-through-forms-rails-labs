class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(categories_attributes)
    categories_attributes.each do |i, cat_atts|
      if cat_atts[:name].present?
        category = Category.find_or_create_by(name: cat_atts[:name])
        if !self.categories.include?(category)
          self.post_categories.build(category_id: category.id)
        end
      end
    end
  end



end
