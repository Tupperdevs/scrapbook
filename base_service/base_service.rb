# Inherit and implement initialize and instance#run methods
class BaseService
  def self.run(*args)
    new(*args).run
  end

  private_class_method :new

  def run
    raise NotImplementedError
  end
end
