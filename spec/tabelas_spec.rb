describe "Tabelas", :tabs do
  before(:each) do
    visit '/tables'
  end


  it 'pega o tony stark na lista' do
    expect(page).to have_content 'Robert Downey Jr'
  end

  it 'pega salário do tony stark' do

    table_rows = all('table tbody tr')
    
    stark = table_rows.detect { |ator| ator.text.include?('Robert Downey Jr')}


    expect(stark).to have_content '$ 10.00.000'
  end

  it 'deve exibir salário vin diesel' do
    diesel = find('table tbody tr', text: '@vindiesel')
    expect(diesel).to have_content '$ 10.000.000'
  end

  it 'deve exibir o filme velozes' do
    diesel = find('table tbody tr', text: '@vindiesel')
    expect(diesel).to have_content 'Velozes e Furiosos'  
  end

  it 'deve exibir o filme com jquery' do
    diesel = find('table tbody tr', text: '@vindiesel')

    movie = diesel.all('td')[2].text
    
    expect(movie).to eql 'Velozes e Furiosos'
  end

  it 'deve exibir o insta do Chris Evans' do
    evans = find('table tbody tr', text: 'Chris Evans')
    insta = evans.all('td')[4].text 
    expect(insta).to eql "@teamcevans"
  end

  it 'deve selecionar Chris Prat para remoção' do
    prat = find('table tbody tr', text: 'Chris Prat')
    prat.find('a', text: 'delete').click

    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql 'Chris Pratt foi selecionado para remoção!'
  end

  it 'deve ser selecionado para edição' do
    prat = find('table tbody tr', text: 'Chris Prat')
    prat.find('a', text: 'edit').click

    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql 'Chris Pratt foi selecionado para edição!'
  end

end
