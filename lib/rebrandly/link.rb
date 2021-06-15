module Rebrandly
  class Link < Element
    attr_accessor :id, :link_id, :title, :slashtag, :destination, :created_at,
                  :updated_at, :status, :tags, :scripts, :forward_parameters,
                  :clicks, :last_click_date, :last_click_at, :is_public,
                  :short_url, :domain_id, :domain_name,
                  :https, :favourite, :sessions


    # Associations
    [:domain, :creator, :integration].each do |association|
      # Creates the getter methods, such as "@instance.domain"
      attr_reader association

      # Creates the setter methods, such as "@instance.domain = ..."
      define_method("#{association}=") do |attrs|
        attrs ||= {}

        # Retrieve the class
        klass = Rebrandly.const_get(association.to_s.rebrandly_camelize)

        # Ex:
        #  @domain = Domain.new(attrs)
        instance_variable_set("@#{association}", klass.new(attrs))
      end
    end


    alias :favorite :favourite
    alias :favorite= :favourite=

  end
end
