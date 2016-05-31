module Camelizer
  refine String do
    def camelize
      self.split('_').map {|w| w.capitalize}.join
    end
  end
end
