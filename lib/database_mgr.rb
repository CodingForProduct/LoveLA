require 'pg'

class DatabaseMgr
  def initialize
    @dbname = 'lovela'
    @user = 'lovela'
    @password = 'lovela'
  end

 attr_accessor :con, :recordset

  def execute(sql)
    @con = connect
    @recordset = @con.exec(sql)
  rescue PG::Error => e
    puts e.message
    @con.close if @con
  ensure
    @recordset
  end

private
  def connect
    con = PG.connect :dbname => @dbname, :user => @user, :password => @password

  rescue PG::Error => e
    #TODO log errors
    puts e.message
    @con.close if @con
  ensure
    @con
  end
end
