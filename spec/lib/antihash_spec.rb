require 'spec_helper'

describe AntiHash do
  include AntiHash

  let (:url) { 'http://harryrschwartz.com' }

  describe :to_base_36 do
    it 'converts a string to base 36' do
      base_36_str = to_base_36(url)
      base_36_chars = ('0'..'9').to_a + ('a'..'z').to_a

      base_36_str.each_char do |c|
        base_36_chars.should include c
      end
    end
  end

  describe :from_base_36 do
    it 'translates a base-36 string back to "normal"' do
      expect(from_base_36(to_base_36(url))).to eq url
    end
  end

  describe :encode do
    it 'converts to something significantly longer' do
      expect(encode(url).size).to be > url.size * 10
    end
  end

  describe :decode do
    it 'converts from encode input' do
      expect(decode(encode('foo'))).to eq 'foo'
    end
  end
end
