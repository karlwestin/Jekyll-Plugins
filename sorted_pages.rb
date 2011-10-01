module Jekyll

  # Extensions to the Jekyll Page class.
  class Page
  
    # Get the "order" value of the page from YAML header.
    def order
        if (self.data["order"].is_a? Integer)
            index = self.data["order"]
        else 
            index = nil
        end
        index
    end
  end


  class SortedPagesBuilder < Generator
  
    # Sorting pages after user-specified order
    # Mostly for building menus, i guess
    # If order is not defined in the YAML header, it's excluded from the sorted_pages array
    
    # Usage:
    # in Yaml header: order: 2
    # in template: loop over site.sorted_pages
  
    safe true
    priority :high

    def generate(site)
      order = site.pages.delete_if {|x| x.order == nil }
      order = order.sort_by {|obj| obj.order }
      site.config['sorted_pages'] = order
    end

    # Spent way too much time on this. Time to get drunk.

  end
end