require "sinatra/reloader"
require "sinatra"
require 'tilt/erubis'

before do
  @contents = File.readlines("data/toc.txt")
end

def each_chapter
  @contents.each_with_index do |chapter, index|
    number = index + 1
    name = @contents[index]
    content = File.read("data/chp#{number}.txt")

    yield(number,name,content)
  end
end

def chapters_matching(query)
  results = []
  return results if !query || query.empty?

  each_chapter do |number, name, content|
    matches = {}
    paragraphs = content.split("\n\n")

    paragraphs.each_with_index do |text, index|
      id = index + 1
      matches[id] = text if text.include?(query)
    end

    results << {name:name, number:number, paragraphs:matches} if matches.any?
  end

  results
end

helpers do
  def in_paragraphs(text)
    id = 0
    text.split("\n\n").map {|paragraph| "<p id='#{id += 1}'>#{paragraph}</p>"}.join
  end

  def highlight(text,term)
    text.gsub(term,"<strong>#{term}</strong>")
  end
end

not_found do
  redirect "/"
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"
  erb :home
end


get "/search" do
  @results = chapters_matching(params[:query])
  erb :search
end

get "/chapters/:number" do
  number = params['number'].to_i
  chapter_name = @contents[number - 1]

  redirect "/" unless (1..@contents.size).cover? number

  @title = "Chapter #{number}: #{chapter_name}"
  @chapter_txt = File.read("data/chp#{params['number']}.txt")

  erb :chapter
end