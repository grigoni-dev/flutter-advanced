ROUTING
è l'abilità di un'applicazione di navigare attraverso le pagine.


STACK di navigazione (di tipi LIFO)
    - la pagina corrente è in cima allo STACK
    - la pagina precedente è la seconda 
    - la prima pagina vista è l'ultima


due operazioni per muoversi
    PUSH: aggiungo una pagina in cima allo stack
    POP: rimuovo una pagina in cima allo stack


due tipo di ROUTING:
    LOCALE: creo una nuova pagina nel momento in cui aggiungo allo stack
        es. 
            Navigator.push(
                context,
                builder: MaterialPageRoute((context) => UserProfilePage()),
            )
   
    CENTRALIZZATO: dichiarazione anticipata delle routes dell'applicazione e utilizzo richiamando il nome.
        dichiarazione:
            MaterialApp(
                initialRoute: "/",
                routes: {
                    "/": (context) => HomePage(),
                    "/user/profile": (context) => UserProfilePage(),
                }
            ) // NB: è semplicemente un HashMap, con nome e funzione 

        utilizzo:
            Navigator.pushNamed)(
                context, 
                "user/profile",
            )

