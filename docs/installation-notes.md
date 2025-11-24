# Installation du contrôleur de domaine – SRV-DC01

Ce document décrit les étapes suivies pour installer et configurer le contrôleur de domaine `SRV-DC01` pour le domaine `lab.local`.

---

## 1. Création de la VM

- Nom : `SRV-DC01`  
- Système : Windows Server 2019 / 2022  
- RAM : 4 Go (minimum)  
- Disque : 60 Go (minimum)  
- Carte réseau : réseau interne ou NAT avec réseau privé

---

## 2. Configuration réseau de base

Après installation de Windows Server :

- IP : `192.168.10.10`  
- Masque : `255.255.255.0`  
- Passerelle : `192.168.10.1` (facultatif en lab)  
- DNS : `192.168.10.10` (le serveur lui-même après AD)

---

## 3. Renommer le serveur

Dans **System** → **Rename this PC** :

- Nom actuel → `SRV-DC01`  
- Redémarrer ensuite.

---

## 4. Installation du rôle AD DS

Dans **Server Manager** :

1. `Manage` → `Add Roles and Features`.  
2. Sélectionner **Active Directory Domain Services (AD DS)**.  
3. Confirmer l’installation.  
4. À la fin, cliquer sur **Promote this server to a domain controller**.

---

## 5. Promotion en contrôleur de domaine

- Choisir : **Add a new forest**.  
- Nom de domaine racine : `lab.local`.  
- Définir un mot de passe DSRM.  
- Laisser les options par défaut pour un lab.  
- Redémarrer une fois la promotion terminée.

---

## 6. Vérifications

- Ouvrir **Server Manager** → vérifier qu’AD DS est installé.  
- Ouvrir **Active Directory Users and Computers (ADUC)**.  
- Vérifier la présence du domaine `lab.local`.

---

Ces étapes constituent la base de l’environnement Active Directory utilisé pour les scénarios de gestion d’utilisateurs présentés dans ce dépôt.
