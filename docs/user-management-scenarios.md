# Scénarios de gestion des utilisateurs dans Active Directory

Ce document présente plusieurs scénarios typiques de gestion d’utilisateurs dans Active Directory, tels qu’un technicien support/helpdesk peut les rencontrer.

---

## Scénario 1 – Création d’un utilisateur standard

**Objectif :** créer un utilisateur standard pour un nouvel employé.

- OU : `LAB_Users`  
- Nom : `User One`  
- Login : `user1`  
- Mot de passe : défini avec les règles du domaine  
- Options : 
  - L’utilisateur doit changer son mot de passe à la prochaine connexion.

**Étapes :**

1. Ouvrir **Active Directory Users and Computers**.  
2. Naviguer vers l’OU `LAB_Users`.  
3. Clic droit → **New** → **User**.  
4. Remplir les champs (Prénom, Nom, User logon name).  
5. Définir le mot de passe et les options.  
6. Valider.

---

## Scénario 2 – Réinitialisation d’un mot de passe

**Contexte :** l’utilisateur `user1` a oublié son mot de passe.

**Étapes :**

1. Rechercher l’utilisateur `user1` dans `LAB_Users`.  
2. Clic droit sur le compte → **Reset Password**.  
3. Entrer un nouveau mot de passe temporaire.  
4. Cocher **User must change password at next logon**.  
5. Informer l’utilisateur du mot de passe temporaire.

---

## Scénario 3 – Ajout d’un utilisateur à un groupe

**Contexte :** l’utilisateur `user1` rejoint le service support et doit être membre du groupe `GG_LAB_Helpdesk`.

**Étapes :**

1. Ouvrir les propriétés de `user1`.  
2. Onglet **Member Of**.  
3. Cliquer sur **Add…**.  
4. Entrer `GG_LAB_Helpdesk`.  
5. Valider.

---

## Scénario 4 – Verrouillage / déverrouillage de compte

**Contexte :** l’utilisateur `user2` a été bloqué après plusieurs tentatives de connexion.

**Étapes de vérification :**

1. Ouvrir les propriétés du compte `user2`.  
2. Vérifier l’onglet **Account**.  
3. Si l’option **Account is locked out** est cochée, la décocher.  
4. Valider.

---

## Scénario 5 – Création d’un compte technicien helpdesk

**Objectif :** créer un compte `helpdesk1` pour les interventions support.

- OU : `LAB_Users`  
- Nom : `Helpdesk One`  
- Login : `helpdesk1`  
- Membre du groupe : `GG_LAB_Helpdesk`

Procédure similaire aux scénarios 1 et 3.

---

Ces scénarios sont des exemples de ce qu’un technicien support peut être amené à faire au quotidien dans un environnement Active Directory.
