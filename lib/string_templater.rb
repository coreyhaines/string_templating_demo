$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module StringTemplater
  VERSION = '0.0.1'
  def tokenize(context)
    self.gsub(/\$[^ ]*/) { |match|
        context[match[1..-1].to_sym]
      }
  end
end