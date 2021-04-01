require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'set up a connection to database' do
      expect(PG).to receive(:connect).with(dbname: 'test')
      DatabaseConnection.setup('test')
    end
  end

  it 'the connection persists' do
    connection = DatabaseConnection.setup('makersbnb_test')
    expect(DatabaseConnection.connection).to eq connection
  end

  describe '.query' do
    it 'execute query' do
      connection = DatabaseConnection.setup('makersbnb_test')
      expect(connection).to receive(:exec).with('test;')
      DatabaseConnection.query('test;')
    end
  end
end
