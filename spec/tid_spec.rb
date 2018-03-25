require "spec_helper"
describe Tid do
  context "arguments on cli" do
    before do
      @t = Tid.new(%w{one fine day})
    end
    after do
      #File.delete(@t.writable_path)
    end
    it "has content" do
      expect(@t.content).to eq("one fine day")
    end
    it "has a title" do
      expect(@t.title).to eq("one-fine-day")
    end
    it "has a filename" do
      expect(@t.filename).to eq("#{DateTime.now.strftime("%F")}-one-fine-day.md")
      @ot = Tid.new(%w{delete-files-with-File.delete})
      expect(@ot.filename).to match("file-delete.md")
    end
    it "has a writable path" do
      expect(@t.writable_path).to eq("/Users/jesse/Projects/til/data/#{@t.filename}")
    end
    it "writes the file" do
      expect(File.exists?(@t.writable_path)).to eq(true)
    end
  end
end