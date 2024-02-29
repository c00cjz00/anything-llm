#### INSTALL Package sqlite3
```
sudo apt install sqlite3
```

#### INSTALL anything-llm
1. download anything-llm script
```
cd $HOME
git clone https://github.com/c00cjz00/anything-llm.git
```
2. copy ssl folder to anything-llm (ssl/privatekey.key  ssl/root.cer        ssl/server.cer      ssl/uca.cer)
```
cp -rf $YOUR_SSL_FOLDR/ssl $HOME/anything-llm
```
3. stop anything-llm
```
cd $HOME/anything-llm
./stop.sh
```
4. stop anything-llm
```
cd $HOME/anything-llm
./start.sh
```
5. open url
https://$IP:3001

#### SETUP anything-llm
1. LLM Preference, Local AI
```
Local AI Base URL: http://notebook.biobank.org.tw/api/v1
Token context window: 4096
Local AI API Key: ?
```
2. Embedding Preference
```
AnythingLLM Embedder
```
3. Vector Database Connection
```
LanceDB
```
4. Custom Logo
```
Upload your logo
```
5. User Setup
```
Just me, and set password
```
6. Create your first workspace
```
DEMO
```
7. Edit anything-llm/.env
```
LOCAL_AI_MODEL_PREF='TAIDE/b.11.0.0'
```
8. Restart
```
docker restart anythingllm
```
#### LOGIN WEBSITE
Create New Workspace
```
TAIDE/b.11.0.0
TAIDE/t.0.1.0
TAIDE/k.0.1.0
```

#### COMMAND MODE TO UPDATE DB anythingllm.db 
1. Stop anythingllm, and connect to sqlite3 DB 
```
docker stop anythingllm
sqlite3 $HOME/anything-llm/storage/anythingllm.db 
```

2. SQL CMD, than CTRL+Z to exit
``` 
sqlite> UPDATE workspaces SET chatModel = 'TAIDE/b.11.0.0' WHERE name = 'TAIDE/b.11.0.0';
sqlite> UPDATE workspaces SET chatModel = 'TAIDE/t.0.1.0' WHERE name = 'TAIDE/t.0.1.0';
sqlite>  UPDATE workspaces SET chatModel = 'TAIDE/k.0.1.0' WHERE name = 'TAIDE/k.0.1.0';
```
or
```
sqlite> UPDATE workspaces SET chatModel = 'TAIDE/b.11.0.0' WHERE name like '%國語%';
sqlite> UPDATE workspaces SET chatModel = 'TAIDE/t.0.1.0' WHERE name like '%台語%';
sqlite>  UPDATE workspaces SET chatModel = 'TAIDE/k.0.1.0' WHERE name like '%客語%';
```

3. Start anythingllm
```
docker start anythingllm
```

#### Multi-User Mode
1. Setup -> Security -> Multi-User Mode -> Save
```
Admin account username
Admin account password
```
2. Setup -> Users -> Add User
```
Username: 
Password:
Role: Default
```
3. Setup -> Workspaces -> Click [...] to share workspace to user
```
Checked the user checkbox
```
4. Singout and login with normal username and password
```
Username: 
Password:
```

#### RAG
1. login with admin
2. Create New Workspace
```
TAIDE/k.0.1.0 (醫學百科)
```
3. Update sql DB
- Stop anythingllm, and connect to sqlite3 DB 
```
docker stop anythingllm
sqlite3 $HOME/anything-llm/storage/anythingllm.db 
```
- SQL CMD, than CTRL+Z to exit
```
sqlite>  UPDATE workspaces SET chatModel = 'TAIDE/k.0.1.0' WHERE name LIKE 'TAIDE/k.0.1.0%';
```
4. Restart anythingllm
```
docker restart anythingllm
```
5. Go the workspace TAIDE/k.0.1.0 (醫學百科)
```
upload document, save and EMBED
```
6. Setup -> Workspaces -> Click [...] to share workspace to user
```
Checked the user checkbox
```
7. Singout and login with normal username and password
```
Username: 
Password:
```
8. ask question to  workspace TAIDE/k.0.1.0 (醫學百科)
- 問題: 什麼是濕疹? (沒有找到相關輔助文件)
```
季節疹（英文名:Varicella-zoster）又名水禾疹抑係風疹，佢係一種輒見个傳染病，主要通過接觸感染者个水禾疹病毒（VZV）感染皮膚摎神經系統。這種病會引起皮膚起紅斑仔摎水疹，一般持續3-4禮拜，還過可能會引發神經痛抑係發癱。

閒吔預防這種病，接種水禾疹疫苗係當有效个方法，乜做得通過採取兜仔預防措施來降低感染風險，包含避免接觸既經感染者、避免觸摸分人遰著病个皮膚、保持良好个個人衛生習慣等。係講你試著自家可能感染吔季節疹，建議黏時就做醫生看。
```

9. ask question to  workspace TAIDE/k.0.1.0 (醫學百科)
- 問題: What is ECZEMA? (找到相關文件)
```
蕁疹係一種輒見个慢性皮膚病，佢係由炎症反應引起个。一般來講，這種病會損害皮膚个表皮層，還過會在皮膚項形成紅腫个區域。平常，這種病會持續幾下禮拜抑係幾下月，還過可能會反覆發作。閒吔預防這種病哦，做得採取兜仔預防措施，包含避免接觸分人污染个物品、保持良好个個人衛生習慣、避免食菸等。係講你試著自家可能感染了蕁疹，建議黏時就做醫生看。
```
- 相關文件1 32% match
```
60-61.
Merrell, Woodson. “How I Became a Low-Carb Believer.”
Time (Nov. 1, 1999): 80.
Turner, Richard. “The Trendy Diet That Sizzles.” Newsweek
Sept. 6, 1999): 60.
GALE ENCYCLOPEDIA OF MEDICINE 2
402
Atkins diet
GEM - 0001 to 0432 - A 10/22/03 1:43 PM Page 402OTHER
Atkins Center for Complementary Medicine. 152 E. 55th St.,
New York, NY 10022. 212-758-2110. <http://www.atkins
center.com>.
Ken R. Wells
Atopic dermatitis
Definition
Eczema is a general term used to describe a variety
of conditions that cause an itchy, inflamed skin rash.
Atopic dermatitis , a form of eczema, is a non-conta-
gious disorder characterized by chronically inflamed
skin and sometimes intolerable itching .
Description
Atopic dermatitis refers to a wide range of diseases
that are often associated with stress and allergic disor-
ders that involve the respiratory system, like asthma and
hay fever . Although atopic dermatitis can appear at any
```
- 相關文件2 47% match
```
age, it is most common in children and young adults.
Symptoms usually abate before the age of 25 and do not
affect the patient’s general health.
About one in ten babies develop a form of atopic
dermatitis called infantile eczema. Characterized by skin
that oozes and becomes encrusted, infantile eczema most
often occurs on the face and scalp. The condition usually
improves before the child’s second birthday, and medical
attention can keep symptoms in check until that time.
When atopic dermatitis develops after infancy,
inflammation, blistering, oozing, and crusting are less
pronounced. The patient’s sores become dry, turn from
red to brownish-gray, and skin may thicken and become
scaly. In dark-skinned individuals, this condition can
cause the complexion to lighten or darken. Itching asso-
ciated with this condition is usually worst at night. It can
be so intense that patients scratch until their sores bleed,
sometimes causing scarring and infection.
```
- 相關文件3 49% match
```
KEY TERMS
Acne —A skin condition in which raised bumps,
pimples, and cysts form on the face, neck, shoul-
ders and upper back.
Bacteria —Tiny, one-celled forms of life that cause
many diseases and infections.
Bowel —The intestine; a tube-like structure that
extends from the stomach to the anus. Some diges-
tive processes are carried out in the bowel before
food passes out of the body as waste.
Cyst —An abnormal sac or enclosed cavity in the
body, filled with liquid or partially solid material.
Eczema —Inflammation of the skin with itching
and a rash. The rash may have blisters that ooze
and form crusts.
Pimple —A small, red swelling of the skin.
Psoriasis —A skin disease in which people have
itchy, scaly, red patches on the skin.
Pus —Thick, whitish or yellowish fluid that forms
in infected tissue.
Triglyceride —A substance formed in the body
from fat in the diet.
Antiangina drugs
Definition
Antiangina drugs are medicines that relieve the
```
- 相關文件4 51% match
```
encrusted skin, followed by applications of petroleum
jelly or vegetable shortening to prevent the skin’s natural
moisture from escaping.
Externally applied (topical) steroids or preparations
containing coal tar can relieve minor itching, but coal tar
has an unpleasant odor, stains clothes, and may increase
skin-cancer risk. Excessive use of steroid creams in
young children can alter growth. Pregnant women should
not use products that contain coal tar. Topical steroids can
cause itching, burning, acne , permanent stretch marks,
and thinning and spotting of the skin. Applying topical
steroids to the area around the eyes can cause glaucoma .
Oral antihistamines , such as diphenhydramine
(Benadryl), can relieve symptoms of allergy-related atopic
dermatitis. More concentrated topical steroids are recom-
mended for persistent symptoms. A mild tranquilizer may
be prescribed to reduce stress and help the patient sleep,
```





