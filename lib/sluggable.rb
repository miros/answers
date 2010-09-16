module Sluggable

  def create_slug
    value_to_slug = read_attribute(self.class.slug_attribute_name)
    slug = create_slug_from(value_to_slug)
    write_attribute(:slug, slug)
  end

  def create_slug_from(string)
    string.dirify;
  end

  class << self

    def included(includer)

      includer.before_validation :create_slug

      class << includer
        @slug_attribute_name = nil
        attr_reader :slug_attribute_name
        def use_as_slug(attribute_name)
          @slug_attribute_name = attribute_name
        end
      end

    end

  end

end