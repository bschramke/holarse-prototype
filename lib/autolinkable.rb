module Holarse
  module Api
    class Autolinkable

      def create_title_list(articles)
	clean combine_titles(articles)
      end

      private

      def combine_titles(articles)
        articles.map(&to_title_objects) + articles.map(&to_alternate_title_objects)
      end 

      def clean(articles)
	articles.delete_if &misses_title
      end 

      def to_title_objects
        Proc.new { |o| { :id => o.id, :title => o.title } } 
      end 

      def to_alternate_title_objects
        Proc.new { |o| { :id => o.id, :title => o.alternate_title } } 
      end 

      def misses_title
        Proc.new { |i| i[:title].nil? || i[:title].empty? }
      end

    end
  end
end

