class Hash
  
  # Like has_key? but accepts an list of keys and returns true of self has every
  # key in the array
  def has_keys?(key, *other_keys)
    other_keys.unshift key
    other_keys.flatten.all?{ |k| self.has_key? k }
  end
  
  # Like has_key? but accepts a list of keys and returns true of self has any
  # key in the array
  def has_any_key?(key, *other_keys)
    other_keys.unshift key
    other_keys.flatten.any?{ |k| self.has_key? k }
  end
  
end