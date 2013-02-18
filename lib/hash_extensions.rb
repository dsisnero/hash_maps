module HashExtensions
  VERSION = '0.0.1'


  def map_kv
    self.reduce({}) do |result,hash_array|
      key,value = hash_array
      new_key,new_value = yield key,value
      result.merge( { new_key => new_value})
    end
  end


  def map_keys()
    self.reduce({}) do |result, hash_array|
      key,value = hash_array
      new_key =yield key
      result.merge( { new_key => value})
    end
  end

  def map_values()
    self.reduce({}) do |result, hash_array|
      key,value = hash_array
      new_value = yield value
      result.merge({ key => new_value})
    end
  end

end


class Hash; include HashExtensions; end
