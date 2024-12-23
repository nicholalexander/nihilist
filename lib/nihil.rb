# frozen_string_literal: true

require_relative "nihil/version"

module Nihil
  @@__nihil_original_nil_methods = {}
  @@__nihil_insane_mode_active = false

  def self.new(*args) = Ist.new(*args)

  def self.method_missing(method_name, *args, &block) = Ist.new.send(method_name, *args, &block)

  def self.respond_to_missing?(_method_name, _include_private = false) = true

  def self.insane_mode!
    return if @@__nihil_insane_mode_active

    [:method_missing, :respond_to_missing?].each do |method_name|
      if ::NilClass.method_defined?(method_name)
        @@__nihil_original_nil_methods[method_name] = ::NilClass.instance_method(method_name)
      end
    end

    ::NilClass.instance_eval do
      define_method(:method_missing) { |*_args, &_block| nil }
      define_method(:respond_to_missing?) { |*_args| true }
    end

    @@__nihil_insane_mode_active = true
  end

  def self.simmer_down!
    return unless @@__nihil_insane_mode_active

    ::NilClass.instance_eval do
      [:method_missing, :respond_to_missing?].each do |method_name|
        if @@__nihil_original_nil_methods[method_name]
          define_method(method_name, @@__nihil_original_nil_methods[method_name])
        else
          remove_method(method_name)
        end
      end
    end

    @@__nihil_insane_mode_active = false
  end

  class Ist
    def initialize(*)
    end

    define_method(:method_missing) { |*_args, &_block| nil }
    define_method(:respond_to_missing?) { |*_args| true }
  end

  private_constant :Ist
end
