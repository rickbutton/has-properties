module HasProperties
  attr_accessor :props
  
  def has_read_properties(*args)
    @props ||= []
    check_unique args
    @props += args
    instance_eval { attr_reader *args }
  end
  
  def has_write_properties(*args)
    @props ||= []
    check_unique args
    @props += args
    instance_eval { attr_writer *args }
  end
  
  def has_read_write_properties(*args)
    @props ||= []
    check_unique args
    @props += args
    instance_eval { attr_accessor *args }
  end
  alias_method :has_properties, :has_read_write_properties

  def self.included base
    base.extend self
  end

  def initialize(args)
    args.each {|k,v|
      instance_variable_set "@#{k}", v if self.class.props.member?(k)
    } if args.is_a? Hash
  end
  
  private
    def check_unique(args)
      common = @props & args
      raise(ArgumentError, 
      "You can only define a property once.\n" +
      "These properties were defined more than once: #{common.join(',')}") unless common.empty?
    end
end
