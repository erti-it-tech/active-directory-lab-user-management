# Lab Active Directory – Installation & Gestion des utilisateurs

Ce dépôt présente un **lab Active Directory** utilisé pour pratiquer les tâches courantes d’un **technicien support / helpdesk** :  
- installation et configuration d’un contrôleur de domaine,  
- création et gestion d’utilisateurs et de groupes,  
- premiers scripts PowerShell pour automatiser des actions simples.

L’objectif est de montrer une approche structurée et documentée d’un environnement Active Directory de base, tel qu’on peut le rencontrer dans une entreprise.

---

## 🎯 Objectifs du lab

- Installer un contrôleur de domaine Active Directory dans un environnement de test.  
- Joindre un poste client au domaine.  
- Créer des unités d’organisation (OU), utilisateurs et groupes.  
- Tester quelques scénarios typiques de support :  
  - création de comptes,  
  - réinitialisation de mots de passe,  
  - ajout d’un utilisateur à un groupe,  
  - blocage / déblocage de compte.  
- Automatiser certaines tâches avec **PowerShell**.

---

## 🏗️ Architecture du lab

Le lab est basé sur un environnement virtuel simple :

- **1 VM Windows Server** (contrôleur de domaine)  
  - Nom : `SRV-DC01`  
  - Rôle : Active Directory Domain Services (AD DS)  
  - Domaine : `lab.local`  

- **1 VM Windows 10 / 11** (poste client)  
  - Nom : `CLT-01`  
  - Membre du domaine `lab.local`  

> Remarque : les machines virtuelles peuvent être créées avec VirtualBox, Hyper-V, VMware ou tout autre hyperviseur.

---

## ⚙️ Prérequis

- PC avec suffisamment de ressources (idéalement 16 Go de RAM, mais 8 Go peuvent suffire avec des petites VMs).  
- ISO **Windows Server** (2019 ou 2022) pour le contrôleur de domaine.  
- ISO **Windows 10/11** pour le poste client.  
- Un outil de virtualisation :  
  - VirtualBox, Hyper-V, VMware, etc.  
- Connexion réseau interne entre les VMs.

---

## 🧩 Étapes principales

### 1. Installation de Windows Server et configuration de base

1. Créer une VM `SRV-DC01`.  
2. Installer Windows Server.  
3. Configurer :
   - un nom de machine : `SRV-DC01`,  
   - une IP fixe (par exemple 192.168.10.10),  
   - DNS pointant vers 192.168.10.10 (lui-même, une fois AD installé).

La documentation détaillée est dans :  
➡️ `docs/installation-notes.md`

---

### 2. Promotion en contrôleur de domaine (Active Directory)

1. Ajouter le rôle **Active Directory Domain Services (AD DS)**.  
2. Promouvoir le serveur en contrôleur de domaine.  
3. Créer le domaine : `lab.local`.

---

### 3. Création des OU, utilisateurs et groupes

Les objets principaux créés :

- OU : `LAB_Users`, `LAB_Groups`, `LAB_Computers`.  
- Utilisateurs :  
  - `user1` : utilisateur standard  
  - `user2` : utilisateur standard  
  - `helpdesk1` : compte technicien support  
- Groupes :  
  - `GG_LAB_Helpdesk`  
  - `GG_LAB_Users`

Les scénarios complets se trouvent dans :  
➡️ `docs/user-management-scenarios.md`

---

### 4. Poste client membre du domaine

Pour la VM `CLT-01` :

1. Installer Windows 10/11.  
2. Configurer une IP compatible (ex. 192.168.10.20).  
3. DNS pointant vers `SRV-DC01` (192.168.10.10).  
4. Joindre le poste au domaine `lab.local`.  
5. Tester la connexion avec les comptes créés (`user1`, `user2`, etc.).

---

### 5. Scripts PowerShell

Ce dépôt contient quelques exemples de scripts PowerShell simples dans le dossier `scripts/` :

- `ad-create-test-users.ps1` : création de plusieurs comptes utilisateurs de test.  
- `ad-reset-password.ps1` : exemple de réinitialisation de mot de passe utilisateur.  

Ces scripts ne sont pas destinés à la production mais à l’apprentissage.

---

## 📂 Structure du dépôt

```text
active-directory-lab-user-management/
│
├── README.md
│
├── docs/
│   ├── installation-notes.md
│   └── user-management-scenarios.md
│
├── scripts/
│   ├── ad-create-test-users.ps1
│   └── ad-reset-password.ps1
│
└── screenshots/
    ├── ad-users-and-computers.png
    ├── join-domain.png
    └── login-domain-user.png
