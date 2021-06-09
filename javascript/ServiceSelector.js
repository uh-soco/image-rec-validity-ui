var db = LocalStorage.openDatabaseSync("ImageRecServiceKeys", "1.0", "Keys for various image recognition services", 50);

function setup_database() {
  try {
    db.transaction( function(tx) {
        tx.executeSql('CREATE TABLE IF NOT EXISTS ServiceKeys(service TEXT, name TEXT, value TEXT)');
      } )
  } catch (err) {
      console.log("Error creating table in database: " + err)
  };
}

function has_been_configured( service ) {

    var ret = false;

    db.transaction( function(tx) {

        var results = tx.executeSql("SELECT * from ServiceKeys WHERE service='" + service + "'");

        if( results.rows.length > 0 ) {
          console.log("Config OK");
          ret = true;
        }

      } )

    return ret;
}

function save( service, key, value ) {

  db.transaction( function(tx) {

    var query = "REPLACE INTO ServiceKeys(service, name, value) VALUES('" + service + "', '" + key + "', '" + value + "')"

    console.log( query )

    tx.executeSql( query );


  } )

}
