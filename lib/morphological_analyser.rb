require 'okura/serializer'

class MorphologicalAnalyser

  @@tagger ||= Okura::Serializer::FormatInfo.create_tagger Rails.root.join("config", "okura-dic").to_s

  def extract_noun(words)
    ret = []
    parse(words).each do | node |
      word = node.word
      ret << word.surface if word.left.text.split(',')[0] == "名詞"
    end
    ret
  end

  private
  def parse(words)
    nodes = @@tagger.parse(words)
    nodes.mincost_path
  end

end