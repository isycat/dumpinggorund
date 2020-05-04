|Value|#nil?|#empty?|#blank?|#present?|
|--- |--- |--- |--- |--- |
|5|false|NoMethodError|false|true|
|""|false|true|true|false|
|" "|false|false|true|false|
|"\t\n"|false|false|true|false|
|[]|false|true|true|false|
|["a"]|false|false|false|true|
|{}|false|true|true|false|
|{a: "b"}|false|false|false|true|
|Set.new|false|true|true|false|
|nil|true|NoMethodError|true|false|
|true|false|NoMethodError|false|true|
|false|false|NoMethodError|true|false|
