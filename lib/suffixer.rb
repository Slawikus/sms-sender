class Suffixer
  include Enumerable

  def initialize(total_parts)
    @total_parts = total_parts

    raise ArgumentError if less_than_two_parts? || too_many_parts?
  end

  def each
    (1..total_parts).each { |part| yield " - Part #{part} of #{total_parts}" }
  end

  private

  attr_reader :total_parts

  def less_than_two_parts?
    total_parts < 2
  end

  def too_many_parts?
    total_parts >= 1_000_000_000_000
  end
end
