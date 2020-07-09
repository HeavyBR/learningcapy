describe 'Hover', :hover do
  
  before(:each) do
    visit "https://training-wheels-protocol.herokuapp.com/"
    click_link('Hovers')
  end

  it 'quando passo o mouse sobre o blade' do
    blade = find('img[alt=Blade]')
    blade.hover 

    expect(page).to have_content 'Nome: Blade'
  end

  it 'quando passo o mouse sobre o card do pantera negra' do
    blade = find('img[alt^="Pantera"]')
    blade.hover 

    expect(page).to have_content 'Nome: Pantera Negra'
  end

  
  it 'quando passo o mouse sobre o card do homem-aranha' do
    blade = find('img[alt="Homem Aranha"]')
    blade.hover 

    expect(page).to have_content 'Nome: Homem Aranha'
  end

end