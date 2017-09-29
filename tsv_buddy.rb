# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
  	@data = []
  	line = []
    tsv.each_line { |x| line << x }
    key = line[0].split("\t")
    key.map!(&:chomp)
    #puts key
    line.shift
    line.each do |x|
      record = {}
      value = x.split("\t")
      value.map!(&:chomp)
      key.each_index { |index| record[key[index]] = value[index] }
      @data.push(record)
    end
    @data
    #puts @data
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
begin
  def to_tsv
    keys = ''
    tsv = ''
    @data[0].each_key { |key| keys.concat(key + "\t") }
    keys.chop!
    tsv = keys + "\n"
    @data.each do |content|
      content.each_value { |value| tsv.concat(value + "\t") }
      tsv.chop!
      tsv.concat("\n")
    end
    tsv
  end
end
end
