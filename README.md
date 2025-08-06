# Test Flutter – App di gestione appuntamenti
## Obiettivo
Sviluppare una mini app Flutter per la gestione appuntamenti, con:
- Splash screen nativa (flutter_native_splash)
- Login con autenticazione via API mock
- Stato gestito con flutter_riverpod
- Salvataggio e recupero appuntamenti via backend mock
- UI con BottomNavigationBar (3 sezioni)

**Funzionalità richieste**
### Splash Screen
- Usare flutter_native_splash
- Mostrare logo centrato + colore di sfondo
- Navigare automaticamente alla schermata di login

### Login
- Form con email e password
- Validazione email + password ≥ 6 caratteri
- Chiamata POST a API mock:

Esempio:
POST https://reqres.in/api/login
Body:
    {
        "email": “dotitsrl@gmail.com",
        "password": "Password1@"
    }

- Se successo → naviga alla Home, altrimenti mostra errore

### Home con BottomNavigationBar
*Tab 1* – Aggiungi appuntamento
- Modello appuntamento:
    o Giorno
    o Ora inizio
    o Ora fine
    o Titolo
    o Note (facoltative)
- Alla conferma: invia POST al backend mock (es. https://jsonplaceholder.typicode.com/posts)
- Validare che oraFine &gt; oraInizio

*Tab 2* – Lista appuntamenti
- Recupera appuntamenti via GET o da stato(se si aggiunge appuntamento va refreshato)
- Filtro per:
    o Scartare in automatico appuntamenti già passati in base a giorno e ora fine (puoi decidere tu come gestire questa cosa se facendoti restituire tutti gli appuntamenti e fare il filtro con flutter o mandare l’orario attuale e filtrarli da be, in questo caso occhio a quelli che salvi sullo stato)
    o Ricerca per titolo
- Messaggio se lista vuota

*Tab 3* – Profilo
- Mostrare email utente loggato
- Bottone Logout → torna alla login e resetta stato

Specifiche tecniche
- Flutter 3.10+
- flutter_riverpod per tutta la gestione dello stato
- Networking via http o dio
- Architettura chiara e modulare:
    lib/
    models/
    screens/
    services/
    providers/
    widgets/

*NB*: I nomi dei file e delle cartelle devono essere scritti come da standard e nomi delle variabili comprensibili.

## Extra
- Salvataggio token in shared_preferences
- Tema custom
- Responsive layout