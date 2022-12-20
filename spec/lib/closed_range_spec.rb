describe ClosedRange do
  let(:closed_range_instance) { ClosedRange.new(initial_num, second_num) }
  describe '#initialize' do
    context '数の大小関係が 第1引数 < 第2引数 の場合' do
      let(:initial_num) { 1 }
      let(:second_num) { 2 }
      example '下端点と上端点が正しくセットされること' do
        # MEMO: これは一緒に確認したい項目なので、一緒にexpectで検査する
        expect(closed_range_instance.instance_variable_get(:@lower_num)).to eq initial_num
        expect(closed_range_instance.instance_variable_get(:@upper_num)).to eq second_num
      end
    end
    context '数の大小関係が 第1引数 > 第2引数 の場合' do
      let(:initial_num) { 2 }
      let(:second_num) { 1 }
      example '下端点と上端点が正しくセットされること' do
        expect(closed_range_instance.instance_variable_get(:@lower_num)).to eq second_num
        expect(closed_range_instance.instance_variable_get(:@upper_num)).to eq initial_num
      end
    end
    context '数の大小関係が 第1引数 = 第2引数 の場合' do
      let(:initial_num) { 3 }
      let(:second_num) { 3 }
      example '下端点と上端点が正しくセットされること' do
        expect(closed_range_instance.instance_variable_get(:@lower_num)).to eq second_num
        expect(closed_range_instance.instance_variable_get(:@upper_num)).to eq initial_num
        expect(closed_range_instance.instance_variable_get(:@upper_num)).to eq closed_range_instance.instance_variable_get(:@lower_num)
      end
    end
  end
end
