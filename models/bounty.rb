require('pg')

class Bounty

  attr_accessor :id, :name, :bounty_value, :cashed_in, :collected_by


  def initialize(bounty)
    @id = bounty['id'].to_i if bounty['id']
    @name = bounty['name']
    @bounty_value = bounty['bounty_value'].to_i
    @cashed_in = bounty['cashed_in']
    @collected_by = bounty['collected_by']
  end

  def save
    db = PG.connect( {dbname: 'bounties', host: 'localhost'})
    sql = "INSERT INTO bounties (
          name,
          bounty_value,
          cashed_in,
          collected_by
          )
          VALUES (
            $1, $2, $3, $4
          )
          RETURNING *
          "

    values = [@name, @bounty_value, @cashed_in, @collected_by]
    db.prepare("save", sql)

    @id = db.exec_prepared("save", values)[0]['id'].to_i

    db.close
  end

  def update

    db = PG.connect({dbname: 'bounties', host: 'localhost'})
    sql = "UPDATE bounties
          SET (name,bounty_value,cashed_in,collected_by) =
              ($2,  $3,          $4,         $5)
          WHERE id = $1
    "
    values = [@id,@name,@bounty_value,@cashed_in,@collected_by]
    db.prepare("update",sql)
    db.exec_prepared("update",values)
    db.close
  end

  def delete
    db = PG.connect({dbname: 'bounties', host: 'localhost'})
    sql = "DELETE FROM bounties
           WHERE id = $1
           "
    values = [@id]
    db.prepare("Delete Bounty", sql)
      db.exec_prepared("Delete Bounty",values)

    db.close
  end

  def self.find_by_id(id)
    db = PG.connect({dbname: 'bounties', host: 'localhost'})
    sql = "SELECT FROM bounties
            WHERE id = $1
    "
      values = [id]
      db.prepare("find",sql)
      found_bounty = db.exec_prepared("find",values)[0]
      db.close
      return Bounty.new(found_bounty)
  end

  def self.update_by_id(id, type, value)
    db = PG.connect({dbname: 'bounties', host: 'localhost'})
    record = self.find_by_id(id)
    record.type = value

    sql = "UPDATE bounties
          SET (name,bounty_value,cashed_in,collected_by) =
              ($2,  $3,          $4,         $5)
          WHERE id = $1
    "
    values = [record.id,record.name,record.bounty_value,record.cashed_in,record.collected_by]
    db.prepare("update",sql)
    db.exec_prepared("update",values)
    db.close
  end

end
