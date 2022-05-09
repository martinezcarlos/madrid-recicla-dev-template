mongo -- "$MONGO_INITDB_DATABASE" <<EOF
    var user = '$SERVER_DB_USER';
    var passwd = '$SERVER_DB_PASSWORD';
    
    db.createUser(
        {
            user: user, 
            pwd: passwd, 
            roles: [
                { 
                    role: "readWrite", 
                    db: '$MONGO_INITDB_DATABASE' 
                }
            ]
        }
    );

    # Create collections
    db.createCollection("containers.clothes");
    db.createCollection("containers.oils");

    # Add indexes
    db.containers.oils.createIndex({ geometry: "2dsphere" });
    db.containers.clothes.createIndex({ geometry: "2dsphere" });
EOF