describe 'Upload', :upload do

  before(:all) do
    @arquivo = Dir.pwd + '/spec/fixtures/arquivo.txt'
    @imagem = Dir.pwd + '/spec/fixtures/imagem.jpg'
  end

  before(:each) do
    visit 'https://training-wheels-protocol.herokuapp.com/upload'
  end

  it 'upload com arquivos texto' do
    attach_file('file-upload', @arquivo)
    click_button('file-submit')
    divArquivo = find('#uploaded-file')
    expect(divArquivo).to have_content 'arquivo.txt'
  end

  it 'upload com arquivos de imagem' do
    attach_file('file-upload', @imagem)
    click_button('file-submit')

    img = find('#new-image')
    expect(img[:src]).to include 'imagem.jpg'
  end

end