Laboratorium 6
Aleksandra Grzywacz

1. Treść pliku Dockerfile
   <img width="824" height="721" alt="image" src="https://github.com/user-attachments/assets/29d0ebab-66b1-4027-8156-64c4369a76f4" />

Powiązanie katalogu z repozytorium za pomocą komendy:
gh repo create pawcho6 --public --source=. --remote=origin --push

2. Budowa obrazu i publikacja

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
docker build --ssh default --build-arg VERSION="lab6-v1" -t ghcr.io/aleksandragrzywacz4/pawcho6:lab6 .

<img width="1047" height="403" alt="image" src="https://github.com/user-attachments/assets/3f19d50f-c4bf-4a23-94bf-e0c96f50fdcd" />

Przesłanie obrazu do rejestru komeną docker push po wcześniejszym zaleogownaiu się za pomocą tokena
Zmieniłam widoczność Package na Public i połączyłam z repozytorium pawcho6

<img width="1627" height="617" alt="image" src="https://github.com/user-attachments/assets/9b226497-5c81-44bf-aea1-14f4fcea4f92" />

3. Wynik działania
<img width="1222" height="99" alt="image" src="https://github.com/user-attachments/assets/9190dd01-11b0-426c-ab56-b5a0b1651be5" />
