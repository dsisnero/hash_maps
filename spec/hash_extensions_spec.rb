require_relative 'spec_helper'

require "hash_extensions"

class Hash; include HashExtensions; end
describe HashExtensions do
  before(:each) do
    @h = {"name" => "hash_extensions",
      "version" => 1,
      why: 'to make it easier'
    }
  end



  it "maps keys" do
    expect(@h.map_keys{|k| k.to_s}).to eq(
                                          {"name"=> "hash_extensions",
                                            "version" => 1,
                                            "why" => "to make it easier"
                                          }
                                          )
  end

  it "maps values" do
    expect(@h.map_values{|v| v.to_s}).to eq(
                                            {"name" => "hash_extensions",
                                              "version" => "1",
                                              :why => "to make it easier"
                                            }
                                            )
  end

  it "maps kv" do
    expect(@h.map_kv{|k,v| [k.to_s,v.to_s]}).to eq(
                                                   {"name" => "hash_extensions",
                                                     "version" => "1",
                                                     "why" => "to make it easier"
                                                   }
                                                   )
  end

end
