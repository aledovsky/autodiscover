module Autodiscover
  class Error < StandardError
    attr_reader :code, :error

    def initialize(code, error)
      @code = code
      @error = error
    end

    def to_s
      @error.respond_to?(:message) ? @error.message : @error
    end

    def unauthorized?
      code.to_s == '401'
    end

    def is_network_issue?
      error.is_a?(SocketError)
    end
  end
end