class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|  #name becomes an instance variable here because in is passed in to the instance. 
      define_method(name) do #this should define our method name def #{name} that does something
        instance_variable_get("@#{name}")   #instance_variable_get needs a symbol or a string as an argument 
        #instance_variable_get(:"#{name}")  #should also work
      end

      define_method("#{name}=") do |thing|
        instance_variable_set("@#{name}", thing) #sets the name instance to thing
      end
      
    end
  end


end
