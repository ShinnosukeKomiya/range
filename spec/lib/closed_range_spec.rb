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
  describe '#display' do
    let(:initial_num) { lower_num }
    let(:second_num) { upper_num }
    let(:lower_num) { 1 }
    let(:upper_num) { 2 }
    subject { closed_range_instance.display }
    example '自身の閉区間の範囲を返すこと' do
      expect(subject).to eq "[#{lower_num}},#{upper_num}]"
    end
  end
  describe '#inspect_containment_closed_range' do
    let(:initial_num) { 3 }
    let(:second_num) { 7 }
    subject { closed_range_instance.inspect_containment_closed_range(validation_value) }
    context '検証値 < 下端の場合' do
      let(:validation_value) { 2 }
      example 'falseを返却すること' do
        expect(subject).to eq false
      end
    end
    context '検証値 = 下端の場合' do
      let(:validation_value) { 3 }
      example 'trueを返却すること' do
        expect(subject).to eq true
      end
    end
    context '検証値 = 上端の場合' do
      let(:validation_value) { 7 }
      example 'trueを返却すること' do
        expect(subject).to eq true
      end
    end
    context '検証値 > 上端の場合' do
      let(:validation_value) { 8 }
      example 'falseを返却すること' do
        expect(subject).to eq false
      end
    end
  end
end
