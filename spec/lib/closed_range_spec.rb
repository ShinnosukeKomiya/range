describe ClosedRange do
  let(:lower_num) { 3 }
  let(:upper_num) { 7 }
  describe '#initialize' do
    subject { ClosedRange.new(lower_num, upper_num) }
    example '下端点が正しくセットされること' do
      expect(subject.instance_variable_get(:@lower_num)).to eq lower_num
    end
    example '上端点が正しくセットされること' do
      expect(subject.instance_variable_get(:@upper_num)).to eq upper_num
    end
  end
end
