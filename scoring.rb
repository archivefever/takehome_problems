# frozen_string_literal: true


class Scoring
  attr_reader :language

# benchmarking tests indicate that peformance is faster with the scores as keys
# also this is more legible
  ENGLISH_TILE_SET = {
    1 => %w[A E I O U L N R S T],
    2 => %w[D G],
    3 => %w[B C M P],
    4 => %w[F H V W Y],
    5 => %w[K],
    8 => %w[J X],
    10 => %w[Q Z]
  }

# defaults to english if no language parameter is provided upon initialization
  def initialize(args={})
    @language = args[:language] || :english
  end

# considered returning an ArgumentError here instead of 0 but decided against it since the 0 provides greater flexibility as features are built out
  def score_letter(letter)
    ENGLISH_TILE_SET.each do |score, tiles|
      if tiles.include?(letter)
        return score
      end
    end
    return 0
  end

end
