describe 'Dropdown', :dropdown do

  it 'item especifico simples' do
    visit "/"
    click_link('Dropdown')
    select('Loki', from: 'dropdown')
    sleep 3
  end

  it 'item especifico com o find' do
    visit "/"
    click_link('Dropdown')
    drop = find('.avenger-list')
    drop.find('option', text: 'Scott Lang').select_option
    sleep 3
  end
  
  it 'qualquer item' do
    visit "/"
    click_link('Dropdown')
    drop = find('.avenger-list')
    drop.all('option').sample.select_option
    sleep 3
  end

end