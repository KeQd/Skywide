PGDMP                      }            ForumDB    17.2    17.2 7    /           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            0           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            1           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            2           1262    16567    ForumDB    DATABASE     |   CREATE DATABASE "ForumDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Polish_Poland.1250';
    DROP DATABASE "ForumDB";
                     postgres    false            �            1259    16610 
   Categories    TABLE       CREATE TABLE public."Categories" (
    "CategoryID" integer NOT NULL,
    "Name" character varying(100) NOT NULL,
    "Description" text,
    "DateCreated" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "Slug" character varying(100),
    "UserID" integer
);
     DROP TABLE public."Categories";
       public         heap r       postgres    false            �            1259    16609    Categories_CategoryID_seq    SEQUENCE     �   CREATE SEQUENCE public."Categories_CategoryID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public."Categories_CategoryID_seq";
       public               postgres    false    220            3           0    0    Categories_CategoryID_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."Categories_CategoryID_seq" OWNED BY public."Categories"."CategoryID";
          public               postgres    false    219            �            1259    16646    Comments    TABLE     �   CREATE TABLE public."Comments" (
    "CommentID" integer NOT NULL,
    "PostID" integer,
    "UserID" integer,
    "Content" text NOT NULL,
    "DateCreated" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public."Comments";
       public         heap r       postgres    false            �            1259    16645    Comments_CommentID_seq    SEQUENCE     �   CREATE SEQUENCE public."Comments_CommentID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Comments_CommentID_seq";
       public               postgres    false    224            4           0    0    Comments_CommentID_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."Comments_CommentID_seq" OWNED BY public."Comments"."CommentID";
          public               postgres    false    223            �            1259    16624    Posts    TABLE     %  CREATE TABLE public."Posts" (
    "PostID" integer NOT NULL,
    "UserID" integer,
    "Title" character varying(100) NOT NULL,
    "Content" text NOT NULL,
    "DateCreated" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "CategoryID" integer,
    "Slug" character varying(100)
);
    DROP TABLE public."Posts";
       public         heap r       postgres    false            �            1259    16623    Posts_PostID_seq    SEQUENCE     �   CREATE SEQUENCE public."Posts_PostID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Posts_PostID_seq";
       public               postgres    false    222            5           0    0    Posts_PostID_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Posts_PostID_seq" OWNED BY public."Posts"."PostID";
          public               postgres    false    221            �            1259    16700    Subscriptions    TABLE     �   CREATE TABLE public."Subscriptions" (
    "SubscriptionID" integer NOT NULL,
    "UserID" integer NOT NULL,
    "CategoryID" integer NOT NULL
);
 #   DROP TABLE public."Subscriptions";
       public         heap r       postgres    false            �            1259    16699     Subscriptions_SubscriptionID_seq    SEQUENCE     �   CREATE SEQUENCE public."Subscriptions_SubscriptionID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public."Subscriptions_SubscriptionID_seq";
       public               postgres    false    226            6           0    0     Subscriptions_SubscriptionID_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."Subscriptions_SubscriptionID_seq" OWNED BY public."Subscriptions"."SubscriptionID";
          public               postgres    false    225            �            1259    16598    Users    TABLE     f  CREATE TABLE public."Users" (
    "UserID" integer NOT NULL,
    "Rights" character varying(50) NOT NULL,
    "Username" character varying(50) NOT NULL,
    "Email" character varying(100) NOT NULL,
    "PasswordHash" character varying(255) NOT NULL,
    "DateCreated" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "'UserID'" integer NOT NULL
);
    DROP TABLE public."Users";
       public         heap r       postgres    false            �            1259    25030    Users_'UserID'_seq    SEQUENCE     �   CREATE SEQUENCE public."Users_'UserID'_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Users_'UserID'_seq";
       public               postgres    false    218            7           0    0    Users_'UserID'_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Users_'UserID'_seq" OWNED BY public."Users"."'UserID'";
          public               postgres    false    227            �            1259    16597    Users_UserID_seq    SEQUENCE     �   CREATE SEQUENCE public."Users_UserID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Users_UserID_seq";
       public               postgres    false    218            8           0    0    Users_UserID_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Users_UserID_seq" OWNED BY public."Users"."UserID";
          public               postgres    false    217            o           2604    16613    Categories CategoryID    DEFAULT     �   ALTER TABLE ONLY public."Categories" ALTER COLUMN "CategoryID" SET DEFAULT nextval('public."Categories_CategoryID_seq"'::regclass);
 H   ALTER TABLE public."Categories" ALTER COLUMN "CategoryID" DROP DEFAULT;
       public               postgres    false    220    219    220            s           2604    16649    Comments CommentID    DEFAULT     ~   ALTER TABLE ONLY public."Comments" ALTER COLUMN "CommentID" SET DEFAULT nextval('public."Comments_CommentID_seq"'::regclass);
 E   ALTER TABLE public."Comments" ALTER COLUMN "CommentID" DROP DEFAULT;
       public               postgres    false    223    224    224            q           2604    16627    Posts PostID    DEFAULT     r   ALTER TABLE ONLY public."Posts" ALTER COLUMN "PostID" SET DEFAULT nextval('public."Posts_PostID_seq"'::regclass);
 ?   ALTER TABLE public."Posts" ALTER COLUMN "PostID" DROP DEFAULT;
       public               postgres    false    222    221    222            u           2604    16703    Subscriptions SubscriptionID    DEFAULT     �   ALTER TABLE ONLY public."Subscriptions" ALTER COLUMN "SubscriptionID" SET DEFAULT nextval('public."Subscriptions_SubscriptionID_seq"'::regclass);
 O   ALTER TABLE public."Subscriptions" ALTER COLUMN "SubscriptionID" DROP DEFAULT;
       public               postgres    false    226    225    226            l           2604    16601    Users UserID    DEFAULT     r   ALTER TABLE ONLY public."Users" ALTER COLUMN "UserID" SET DEFAULT nextval('public."Users_UserID_seq"'::regclass);
 ?   ALTER TABLE public."Users" ALTER COLUMN "UserID" DROP DEFAULT;
       public               postgres    false    217    218    218            n           2604    25031    Users 'UserID'    DEFAULT     x   ALTER TABLE ONLY public."Users" ALTER COLUMN "'UserID'" SET DEFAULT nextval('public."Users_''UserID''_seq"'::regclass);
 A   ALTER TABLE public."Users" ALTER COLUMN "'UserID'" DROP DEFAULT;
       public               postgres    false    227    218            %          0    16610 
   Categories 
   TABLE DATA           l   COPY public."Categories" ("CategoryID", "Name", "Description", "DateCreated", "Slug", "UserID") FROM stdin;
    public               postgres    false    220   �D       )          0    16646    Comments 
   TABLE DATA           _   COPY public."Comments" ("CommentID", "PostID", "UserID", "Content", "DateCreated") FROM stdin;
    public               postgres    false    224   �F       '          0    16624    Posts 
   TABLE DATA           n   COPY public."Posts" ("PostID", "UserID", "Title", "Content", "DateCreated", "CategoryID", "Slug") FROM stdin;
    public               postgres    false    222   �H       +          0    16700    Subscriptions 
   TABLE DATA           S   COPY public."Subscriptions" ("SubscriptionID", "UserID", "CategoryID") FROM stdin;
    public               postgres    false    226   I      #          0    16598    Users 
   TABLE DATA           u   COPY public."Users" ("UserID", "Rights", "Username", "Email", "PasswordHash", "DateCreated", "'UserID'") FROM stdin;
    public               postgres    false    218   �      9           0    0    Categories_CategoryID_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Categories_CategoryID_seq"', 8, true);
          public               postgres    false    219            :           0    0    Comments_CommentID_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Comments_CommentID_seq"', 15, true);
          public               postgres    false    223            ;           0    0    Posts_PostID_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Posts_PostID_seq"', 48, true);
          public               postgres    false    221            <           0    0     Subscriptions_SubscriptionID_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."Subscriptions_SubscriptionID_seq"', 24, true);
          public               postgres    false    225            =           0    0    Users_'UserID'_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Users_''UserID''_seq"', 7, true);
          public               postgres    false    227            >           0    0    Users_UserID_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Users_UserID_seq"', 7, true);
          public               postgres    false    217            }           2606    16620    Categories Categories_Name_key 
   CONSTRAINT     _   ALTER TABLE ONLY public."Categories"
    ADD CONSTRAINT "Categories_Name_key" UNIQUE ("Name");
 L   ALTER TABLE ONLY public."Categories" DROP CONSTRAINT "Categories_Name_key";
       public                 postgres    false    220                       2606    16622    Categories Categories_Slug_key 
   CONSTRAINT     _   ALTER TABLE ONLY public."Categories"
    ADD CONSTRAINT "Categories_Slug_key" UNIQUE ("Slug");
 L   ALTER TABLE ONLY public."Categories" DROP CONSTRAINT "Categories_Slug_key";
       public                 postgres    false    220            �           2606    16618    Categories Categories_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."Categories"
    ADD CONSTRAINT "Categories_pkey" PRIMARY KEY ("CategoryID");
 H   ALTER TABLE ONLY public."Categories" DROP CONSTRAINT "Categories_pkey";
       public                 postgres    false    220            �           2606    16654    Comments Comments_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public."Comments"
    ADD CONSTRAINT "Comments_pkey" PRIMARY KEY ("CommentID");
 D   ALTER TABLE ONLY public."Comments" DROP CONSTRAINT "Comments_pkey";
       public                 postgres    false    224            �           2606    16634    Posts Posts_Slug_key 
   CONSTRAINT     U   ALTER TABLE ONLY public."Posts"
    ADD CONSTRAINT "Posts_Slug_key" UNIQUE ("Slug");
 B   ALTER TABLE ONLY public."Posts" DROP CONSTRAINT "Posts_Slug_key";
       public                 postgres    false    222            �           2606    16632    Posts Posts_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Posts"
    ADD CONSTRAINT "Posts_pkey" PRIMARY KEY ("PostID");
 >   ALTER TABLE ONLY public."Posts" DROP CONSTRAINT "Posts_pkey";
       public                 postgres    false    222            �           2606    16705     Subscriptions Subscriptions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."Subscriptions"
    ADD CONSTRAINT "Subscriptions_pkey" PRIMARY KEY ("SubscriptionID");
 N   ALTER TABLE ONLY public."Subscriptions" DROP CONSTRAINT "Subscriptions_pkey";
       public                 postgres    false    226            w           2606    16608    Users Users_Email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_Email_key" UNIQUE ("Email");
 C   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_Email_key";
       public                 postgres    false    218            y           2606    16606    Users Users_Username_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_Username_key" UNIQUE ("Username");
 F   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_Username_key";
       public                 postgres    false    218            {           2606    16604    Users Users_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY ("UserID");
 >   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
       public                 postgres    false    218            �           2606    16694 !   Categories Categories_UserID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Categories"
    ADD CONSTRAINT "Categories_UserID_fkey" FOREIGN KEY ("UserID") REFERENCES public."Users"("UserID") ON DELETE CASCADE;
 O   ALTER TABLE ONLY public."Categories" DROP CONSTRAINT "Categories_UserID_fkey";
       public               postgres    false    4731    218    220            �           2606    16655    Comments Comments_PostID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Comments"
    ADD CONSTRAINT "Comments_PostID_fkey" FOREIGN KEY ("PostID") REFERENCES public."Posts"("PostID") ON DELETE CASCADE;
 K   ALTER TABLE ONLY public."Comments" DROP CONSTRAINT "Comments_PostID_fkey";
       public               postgres    false    4741    222    224            �           2606    16660    Comments Comments_UserID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Comments"
    ADD CONSTRAINT "Comments_UserID_fkey" FOREIGN KEY ("UserID") REFERENCES public."Users"("UserID") ON DELETE CASCADE;
 K   ALTER TABLE ONLY public."Comments" DROP CONSTRAINT "Comments_UserID_fkey";
       public               postgres    false    218    4731    224            �           2606    16640    Posts Posts_CategoryID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Posts"
    ADD CONSTRAINT "Posts_CategoryID_fkey" FOREIGN KEY ("CategoryID") REFERENCES public."Categories"("CategoryID") ON DELETE CASCADE;
 I   ALTER TABLE ONLY public."Posts" DROP CONSTRAINT "Posts_CategoryID_fkey";
       public               postgres    false    4737    222    220            �           2606    16635    Posts Posts_UserID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Posts"
    ADD CONSTRAINT "Posts_UserID_fkey" FOREIGN KEY ("UserID") REFERENCES public."Users"("UserID") ON DELETE CASCADE;
 E   ALTER TABLE ONLY public."Posts" DROP CONSTRAINT "Posts_UserID_fkey";
       public               postgres    false    222    4731    218            �           2606    16711 +   Subscriptions Subscriptions_CategoryID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Subscriptions"
    ADD CONSTRAINT "Subscriptions_CategoryID_fkey" FOREIGN KEY ("CategoryID") REFERENCES public."Categories"("CategoryID") ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public."Subscriptions" DROP CONSTRAINT "Subscriptions_CategoryID_fkey";
       public               postgres    false    4737    226    220            �           2606    16706 '   Subscriptions Subscriptions_UserID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Subscriptions"
    ADD CONSTRAINT "Subscriptions_UserID_fkey" FOREIGN KEY ("UserID") REFERENCES public."Users"("UserID") ON DELETE CASCADE;
 U   ALTER TABLE ONLY public."Subscriptions" DROP CONSTRAINT "Subscriptions_UserID_fkey";
       public               postgres    false    4731    226    218            %   �  x�u��n�0�g�)no,�H�oF�1Ph�.W��)Y� �1Ĺ}�����[��*)%�Ѡ�xG}���ݩ<()���,i$o���a��.?�@��p���� ����c��p������oM-�ӰmE?52�X��M�6�y��A�<�߅�5�n3,6��s{}����ڈ5,]�c@V�df3�9{eӦ[@��m��q*m��s+��+3�Tjj�U�R���7�� ��t/�:�"Ā�<���I� �h�~����E�z���r�҈�����0J��j���h�#�>�����]<ݗZ	��G��	�j�Qem���/���Ds�]�a��R�,C?�>S�˃��Um�(fq�G�O��Z�D��q�"N�(��8���N���0�Z��L���~*�����p�|O���y�� SΣe����wKw�}���2uG����Pӝ}�m�!s�(}��(���f*�ȸ����1̋()�$@��	9c�4�|��.�
      )   �  x��S�n�0=�_a��1��')!�!!�r���u���u�dm~�o@�N�/�u�ݭz�VdG�7oތ��!@����|�u��vۺ-A�:�A�@W������b}w������ݪcoߧ��
�	Y^�� y����D������S!�ʖsk�p��Kh��β�t���ﻟ,�{b]oz{m���ǊT�Q�*)�����nշ�}k�7u��={������^�j.@�Rȣ�c}�����b�>�atgXy샖�95�W��u	Ԇ~x����j�����z���ƙ�pB��̢��-�?��B���J+.u	FR
"��fI����x�����b1�seJ(K
0���aL�7����X���ߞ���,U�Ag ��~�8R"�B�)H"˨v�&����l��"G����ˊ���݇��5}�Xh��N)���(      '      x��K�W�&��~��*���g<��HEQ)���⺛���������bPR��̪7C$��f��v�F��`�E��9�9�^��Uh̢=�4���]���~��=�Y��5o¬J�z�U�j�V�J�rS�M�˼��j���UD4妯^���Rm�&�D9ݫf2T�j[�y��&Uy��ZE*�d��/�����MU��T��(�ޫ`�U�.å�Ҡ�h����Da�Dz��cЀy�����L���|nh�{�'w���J�h��\G)��F^�4�,�ӻ�*\ʽ��nYE�VU��ˈ�#�4;ri'��9���["�@�*���p������jD_���d��@�]w}͛���d�e�@�+�\���ugboԐ�|�tV�w��g&a�:p:P��^���(,h泰Y��"Lh&=Z�B��)_ɟtC�g����ݏ:H�Ud��uTо�u�J��TI�Hպ�� Kg��"��C�ZН�^��s�>���V8?����l4�y�*廼�	�B��qg�^�> �~@{��~��~	��<T�^���G	��*+{�+�j:/�S���k�m�4�
pc�*����`t2���������?�]����}>�0�وp�*���~4Pu��)&�@���7Ex�K�{�TU���O�*�RU&@R�����fU��s��'�%Zx�0��i7����h��j�<
3`�k�.s�@x̺	�n�仿T	;�t؜(IjCZ�cT�y�nWi~.7a�! ���U��F�i^�-Q�b�4�sz=��$��&T���S�6�8�	j��âfn�SPi������>�Hǖ!NYˉ�q+:k��-v���$�AI�K���oÊ��DMhr3PJ�~�'l]���������dD�i[�!�Əc��O��Aw�|"o$����p�C�mjn��ڇ���U�I/tƛ��b����0�0w���K�	O����N#�d�ˌ�IO��7�#�����K��&�sa��.�tAx" ��G�V�ڝL����!�kU�<dC�+N$FS�I_1��p�0O�4�=�MHB��{vٳ���)t����'� }��ެ��2�*�¤(�9�Jg%��ǎ0�d4E ǭ�t^u�<��_y-B���%�]���,��	*P�<�5b������<�/�L�D���E�^J$��S�մ׺�^�:RդYDkh��C
Q}1���l�&�i%Z���3	��M{��[N�m#�,4v.a*Dh��!�8�cP_�M$%�\�LW��%�c���E=���A���ζ)"¼ y�B���(����J"z�-Ǥ0; �-�c�����?O���cb8�u̭|�R=2GLx�rr},��C;�+�E��h eNlhB>'G>�l�t���)���KQ zt�b#�\���K�5��Bc��&�
b�ȇx����p�L��4�`iw�Cb�Y��ןi���	�%O��sPX^�p�"K��_8��ßi��9�����Q�5a-�5Y�=K���m�ߥzND��p��p���"�����_[,ӥ���2��;c#U���� �v�*:ۜ$�XɴK�c@M��G$�z0"%��.Z���, �IV�U )����Z��E�Ke^�؀ef�L��DiUA�a�TA����gDyI6�a�gVEֈ,�c�5��~"�!X�b�}��ELI�����[3]&�3�J�����`���f��ЇO��P����ȉm�]$bDq�ێUI����I�5��J�NIL`������s��q�`4�Q�kB@�9�����[e�9�𾰧�{B�ߘ�<�#�WGyS�iE0t���o"�bʸ�ӈ��XB���	( �$WGLaWtHP`���� �+<�;�&�������i�zMFƵ���-�ȽAj(e�	/	�!� �v椘g��V���o��яyI�!�W!�:Wp��u�-Yᆄ���TI�	��lb�҃h���LJ!��BE��`�Y�]i�������kp�"��	f���=p���� I-�I��,�K��_�;�Įie�9H���Ԉ�*e�k)���RC��E�g�C�мX�)�`�~i�x�=$�	`��@�Bv��o���3�9�Pϧ���\Zá{���v�EỲ�T�2*��씽��\�3A�Ȉ�Ѽ�L��c��V�j�
v�	�Z�$_f%�K�X�g��2�=*�2������ q���vud�Ah�Azltd�ـ�<��+N	zT$P���Y>����[Y�	R��D�A����qB�e[�XD��E�Kg��	BK#��K@���>�d$:�
�Śt8ڈ:H+`��ը1VEcD ���l�L���ihE�c��{�/Z�y�����d�A��x9!�� ��6�G�3�\�����L}�{b�k��uRԳ��pE� Q��[��~�	���2�}:���R��W�a,CڨOK&#��S�I�ǫ�^�?���;Ò,dv�,�!�h�!�xV�d�l� \�+�� f����ב��	~�`�c��H��WZu�)Yn(-v�Vd-R��,��J��3#��I*��8�$���-�4�c�ͪ�Gf��-�v��/�n}��vr���-����#�qE�`��.`FY�I��(w�V��$��Îv��E�����6lV]��>4 3�-庯����af��*�W��[8�[��=��,�8�gFk%V��Ajw��#�X:��f�����8+�c�J�E~qF�4���̢�H�&��k�U�QJV9- ��0�%�$�X8`b�S�aA�`�Y�A.o k��(h��F5��1Xm������`XK��B8X-0��&,e~��%UJ�vDD�9	�D$�,y8���]+��n��l��&BN�!V�
ʥ(��ypގd�w�낋�Ch��'-�,���o�u��"tPZ|���%�k�ڬ���D����-��p����ѫ<�1/	H��B�
Q3�]�aZ����G�EQ��������g�n�36���h�X?��$2���.#{Lgl�xβ!�]��HZqlct�8���x�W��2���Y��1hl'j-T�ܠtv��o�gD�-���) ��ju��f������p�`z�`8�.&��{�{X�Is���l|ox�yZ�"Y`~�gt8���q$6+��׾W����	6�Ǣ>X�~d�_z_�J	�x�/i�ؼ	�W<�a�����a;�g�=Ȫ�Ԗ�L������s�w�m V2(��"+g i�m�,1P��u�|�<l�4��IJ�Ό�:!�&C,#�X��EEhl��1W&��袗��b�i���bM,x�j��>e�n��m�3`˺�Ǯ~b�\���P����J� ���c�=c�k�R�8#�HT_�w�I=�V�Y	M�(MV���X��&X�x�sK�-����f����d�,�"c��fL �b���pERc &ͦ$Ba~D��u�Q��P�l���7-�t���uo[���6���<�s 3�Lo4�?��夦�� �4�a�`� 2&�F}Ǽ��輠�����<�8KC�mso� �q[����k{}K71�Cۤ� Dn�"��j:/���F�)�μ�Ϸ�F��g*�6�9"w��!]뽧e�a��w?~x?�	��s��*��&X]��5M�X��X;�X��?d��ŧ���f��Xh�ރp=gm�W���Ӌ �ب�"Rʮ����IP�G-`L�9q���/1p>eH�V-\��v'	]5D+ы�i-2�2��49�����02�I(6*�f�F1��3��[��	�&ʙ�A(��*�Z���YA����C�:j	�y�sT����@�b${@��.��&A��]K�v~�m��{D����ح0��r	�����"�#����a[��]$���#�4�Ì1�L�e�\��)d�ȱ�@������3��9�w��X�<yc�f�I�m��@r��^�L�Ih�g���gIw����j�D�g[�?Y��C������;��JM?�z�>D��gT,�����e��ߒsŴA�G��@�8��bzF(�A�6u!�9��v�    �O�b�5�6u���H����_�F� ;����h� ؇ú��q�e��g,�����=}k��W�,~�Ydj��?�i�����*�61����?"�nK���v�a{��B^O��ċ����btv)��}�	��E�|99\���p9\���p9\���p9\���p9\���p9\���p�����L���d8�8����䳩����p9\���p9\���p9\���p9\���p9\���p9\�;��S��Az>>w��S�O�)���r�.���r�.���r�.���r�.���r�.���r��wx�������`pa�SƟ�Ɵr~�.���r�.���r�.���r�.���r�.����{/[����럞'�Sc}<�l�^z�7QQ�3�Qk%_�>�my�N����]�jx�ó����ltol��lhK�߫��x������Ѹ?��8��%(}���]�����F��2��W�F���||v�.�����{�i�i�;�c�ϳL}��Gݏ㏽i��N�g����������ҫ{��w�,���h��}S���y��e�����)OE�a����m#�����J?�y���������6�����W��䛇��'�˧�����]���igTK�v�+3T��^����9�a�-��E���C�ĺXi3�+���fx����*�9H�_���|�L�?u_32���J�w=o~J�2(��;����gnћ5-��O3��fy�=^*{��?w�bv��E���/#o�)z�'�=��������\�߹���?k�sfa��+����$]h�qn#���B ���O+H7�ݏ������>��y�V��3��q�O�4�Y��}����{}u�C���tw�o}�@��v�sk(te�������2o,��M���f�5��`
�c�af`���i�_��"Ӡ��|/u���e8��w?va�a�XG��?�rnA�l���d)��2|�����J��,��o���P�L7�����;���==o��:_Z�p���}���C���{N"�;���=�ѫB>��t�t�`�ʇ|�L5w���?�c�mV��{�-}��q����kե�aA,a�.���Q��~�7t�>� �43�Y9��ʻ-�b�+����������ɟ�i9�>�o;'y[/"k�����q���_��<I��_w�	3�i�B�?�f���Os��D�|��^�E��o+ǻ���Xt�{�U�~ǚڛ6Y�������!�ZUH�;�_L��N���F��lAΈVر$'�Gi��D��G���d�FM?]8��V��y��\:��]����������q8��έ�7:�l��5�J��d��ŊI��w.W�8C,�$��>8=�	��m��y��{���D^��]�z{�	M�>�O�M쭟�!��Si��jm�mw���=���ɘYzz����z���l��4�B'��E|�;��o�9@ج@�΢ޔj�.�s���Z�5�l�7f&�ʕ��G�5�Y��w��g-&bG��k�����De�|;���^��?�/�q��2�h�V�0	!x��_�K#���ˈ��,��wNJ�!��fϯ�v�h�F��k+��	�X}&Y��~�Ö�+u�l�f�?zgǞ�Ũ}]�h�x�&9@�|���Y�{ֺP�����[�B�/�W�F�o��6馤�o Z��)�7�5�@_{{���i���J�ӧ�D>��R��|�f?�E�Ԫ��笖߹��Je!ͫF�;E�`�֭�w�J��Zk�y���3I�+��0����ߎ�G+�4���Aq�ܴ'g.ݳi��N�-�:��=-��h4�w�e��&Y��&�$�HH#�4���m��=�{}��%�WB엽*H�Ak�g�T�r�B����^�T�T}B��<�8��)Av���Oo��w`�Ι@ɴ �YTa��:S�e�#�%�m@�������j*����}ąؘ��O�huN8���ҦB�J^@��!i"X��8�4�5�1Ƞ�-K:훓i��\謧�&I���z.2:��""���ݔY����r�ś�GQ���i�$ ,��c�Y�h���N���hk�/L�ũ��q�ݼ����S��I�.�:��PO R�Bw!m*�+��):��|EKN�:q(��|�t)R��p��%�s��x��UL<10}m�k`\�WA��p�ſN�C�ˊ�sO���{i�h�-+��U�S�jO(
�˔iI{H���)��~��&�^.���3���+z�;���q�&��\��'ӡ�B������k��N�G�Q���_L�Uz=lI�hr�19�c����s�Pb�&��^����O��k��Ћ��'�4q��e3�Zr�sn�);52
� �U{d�4=�AsdM��o���Z>�"��<�?c������	�јq�<�&Ĝ�\k�c�&�w�kXz�t)�L��K�#�=��c���nTG4��t7e����U��*����V��B"�9R��?����)�~�^g�?_�����~��U���)�@�q���-��ϖ-#��ܻ�N�R'�i�%!P�hB��h�/Ҝ;����y���h�hX�W���'�x��uz&D
V<'t̝մ6z8M�ٗ�R��/�|_��&���X :�ۑ���L���o��p8���1�x���1:��)Ӄ����ܵ�P��yo���)�/d����&��,%	��%�Σ�����D�.�
�.���)7b�9�Qo��Q�i"����^����b�KŘ*��M"�ĳ�߂8�F�aà]P�ľS��%i� o�o��!h�-l��=�H�ݻu���2(����h&MՉ]�z�,�V�i�Id%n����wˈ�2�"`%��r/�2��YZ��g�n�ˉ29-l��6��@�w�
��E!�B-��Z�M9�C�6�H�jb�$�,#�����UDc ie�m������&*�r��p�X'%	��$C�ﺩ�w�pH	�ָM���6Z�.*"]5�/�a����X#M%#I3��Q�ItwM"�VO���GDq�\!RWi��.���H�LpA��|���D�C��\�R�:@���Ϟ�=�~�|�݈��(�f���*��a��=^܎���놎f������#H��䋓O�c�ה-�+hC�t&<�M@\�>�%;h��A���� 8VCSyR�bzS� "�
����:���Τk;Ap:�l1�׮�����y�n+'$ i���ȲŮΉ��A�E��`����(�����E��ˬ� gj�[M��S�PPT4�yD(MS� \�#�i{*��+��nH��Xv��~�n�aL
�F%���#!�T
�Ӏ�����PrJ��C4V_�<s�gY�;<ƢަhaxV���k���/�z�&@u{��}@c�I*����	(*@�'�fa��	>W�d��xߜ;������)�`�Fg����V��xj[�A�',v2��BH��lR:k"���K��X�.�"e~���,	����CP"�8�Ӂj��8,���9 {W��mb�/Ž;2�A�#�����e��Ea�D�(�9�1Hf�pD*�x����4ڡA�	d�t��S��"���wQFh��%������m�UP{�V�za���֓��:��S��)~�=h�� ��h�%<K�)�;�k_Й�b��jI�Y��N���U��:� �,c���'-'�$�%�;�t��emQE���g^���أ~��|FT�����/kw���a� 2�I�8K]�x[Vi��*\��Xr��vN"=���D:I7������7+�,�JM�@t)-����8E3Kg�+��~{���p�K�N1d>�7��vF0��� �IzH�-}%���Tg��:?��%��Y��U��D����cFx��Cj�/yhc�� 3Ҥ		�� ��𥉉�f}uc�-p3�[#R��jXZ0�I=}A/y|K��:� 8����V�a"RC�"8�Ƴ��H��'�a�O��"��xi����h�gj:�h���$������W��l�E�%e�_E*��^�����2�z�ЙVa�    ~�@{;�Z-�1�uڋ*�Tмq����Cz��Ӕ$tb ���f�-Ѫd� tyt~�Ow��N)��V+#!�����D�[k�z�J�3Y
����O>�"[�_K���q�	f���!v���>��C�`�ۈ�1u��A�'���ԇ�!97C��G��hߐ�D��C�^_ӣ��6ʺ'a�F'����
"p�W$���sikE����Md�Btx권��~"ԧ�"�Ա���n�f����&�&�j��ӭjz�۰LN���W�p�5L��x�A�F��	���� ����w��S��'o^{b[�F�{b!!���QW�s��^�%�qV�XezI���0ާ^��`F�i�A�Ӟ�g`:+�Uɴ ��.f�jk$���G]��s9=����ˀ�az�'�yh+=T�6``�a�5J��p���� iy�'�҅	m�hD"�G��U�F��	挣�o��p&��9��s<Iz#���#s��=�7B���B�r3�D(�����-� {���=�!��-nB|�\��wi�D�7��D��	�G��G�
��껿ĵ�P���6Y�'��nٓ/i�SV��@5V��T��� �Ţ�(_���R�L�����^l͐�ho����VpA�=�fo���Uim�t��O3I�.�*e��L���,�d
��X�`@(ޤ��Du�>`��B����L�Naz�Ԫ#�u�X.��p�2��4)H�:n���d�t3_�1���\Bd�Ԑ��Q(��Z,�$�BҎ��߈��~uU('�{(�����!�=6�G;�y�O���Σ�$c1R�1�s���@�;E���������KT�;���.g�a���Pb-��zFFl���,_�FGɦ߱0TbG�X����cR �n���ِd������
����]W������pr��kI�/N0d6�T5L��µ�"a.~��2�)L��K��6%����׮���:���gh�w�z���I��º�t@Z��v2y0���ӳ���{4���x5>#2�e��0��\�����~�^A<?����JT�*/s����J}�iӢ��} ��U��%�R��K�&�&�+g�@��r��e��A:�n����j^Ɗ����4#8Z~,�<����ɰ���d���;����WO��۳5�{��� "u�M��Y�G�?�n��ں����õ��+8gZ��>���3�y��M�]�k{��t@ˢ�u� ��U͝�"���E�;QojkpCON���V�pV;�~c���=��l�ز�uA`��c��Nb��Mv����^�o�7�E ,X�w��U�y9���M���Y��7u�s�tܽ�*m�ɒ��V2ڹ�ε�e�&�/�1ԕ��6d9��u�3bI�bW���8�h��	�-���%�[�6� fmmZV�#Yhr>R�����z%�0Qy�Hdz���Ԇ8@:�Hl��A��5Q�7���c�F�b���RT"c�s>	�F��j�v~���D�ÿ�/HQc���,U5S,QέĪ�DTG�����UtbU�lp����"����y�,r���^��x�!����/��櫓rk�b�l�7�oiM�����nd���vY^\mi�.�H���>�^ �Eb@���F3_�0[����S�,������-�SA���B��&	���HĎ�r�B�MRҎY_�F8ϋӡ�[|2�����v�r�p9��QJg n��O�:-
�uN���[d�Z�l�o��M�-!�?�}�^RƩzF*�I�������&����~��� XZx��?Z���]l"/�?4�|����T���8N'x
�^�`r>=�&�9#ŀ���iD1�+���S�p<	��Ǚ�h�6br,2x�|�z:��������0�ӱ0���6L\;
މk�X�o2�!�ZuD�<6�n`;9S�N��xzs����p�Ť�E	�V�o�7��������7y��w����o��������Zڣ�(����y�ORϒ �H,q!|��XUM4-V ����3H8�Y�6��*ٞO{Bg!j3)��e�����]3��Vc�����E��q�)������D{̉�-���u��lݩt��1p@33$�,djIt�&�	�/�v�������F�Qkc>�Ak/���b��9?�'v��
T��'i�ړ//���z4�vBQ��^n�έ/<�)f��·�Dl�DX2�O����Ƴ�Y��G�b$���DJ؂�4XP�r4�
�m�h�{�5tO'~c�4z��BUU3K�Ĵ��/Ğn���+~���=�]_OAh���S���0�G��X��5�u��L�~@�����l��sP> d-���������tF�i�y���-�̇�E�]�n
�'��֥�`@	"�y�P��n����yɞ7b5s�Q�g�;y�����C�U�i�u/?�7>J8V%tAc+xll���ןs<�WO%ص�X�U�	�]܎lL]YNҋ�LܓQ�PbL��8"�C�k�+_5"/9T��Nz����XxȠ;yt�k4�������8<Ɓ�̀s���ן	��Ipڂ��J?�c�]����I�pp��ȓc	�"��hOq��8W�}��G{^d�9��21m�
�!V��ǮX�݋{
9v�{\��3�kͫ1��iOb%�]��j�ʳ���H��<3G![��<4��-snH�&��*=�|�����fȍ
�u6qi�p�r�,ڥ��8j����;x7�d���]���\#����f��jy��Q�P��*(�$Ǥhb�0�VeAh:o`�ݢmgo>����"����/&���U�g}KZ�@��4�L�8ٚ�3�t��|�Ռ�������*8��>��K ܸ&�����*V���/2t(ŏ���?~[
���%1� ��#I��%᳎8�o����v�~�*���H�K�����s�����F��c��Wǿ%�NƿGz���uн�{�B�O��N����t�n$���nO��󣸂���������.A�S��Xz�����@�*ll� Wd��D��c_�u1'y����Cm�Hn.��1�@sx"�Wu��HY?T�B��9�#�`
�m��hM���\�[&�g",�M�#b<_*RO����)�$�g)�'��G�u�=�������(itk#�֤�R��r +g�եQO����u?�h��w�8
o�#�6
y*¶g��ֆex�'��`�k����[?f��,
g�rVcP~gL.���욆,�0<!���U���dO����$�tv����,�	 �6%���,���B��я�WJ`���Z�H���'�?��k���2A�)G�{|�$�AO���p4h%��0mY�-d�'� 0B��:\��O��{%�����ڟ#�l���y�р�r�qOY$�g���Nď�B�r���iO�Lخx��˞�a���z!n8��%��ڜ�K�|C'_|*Dl�t9d��ǭa���!4tG���������ŵf��è�2��U�Xo�O��Yn2P�dx�������|��sݣ6�L�$e93v�R�CvB�=�S�D�淥xu9��F�o��#��5}�K�lX�,!/����X�7�B�fx�'�*fL��c���R��d+9i�3&K�e�mA��\v���T�O��l�4�k��DKc`IU�dMb�O P���eCRp�Fv��0�6�b5�AH��.���zC7�GWߞ��Y;a�	=�8���H���;I#���+��d�1e����� Z�U�q8����m%��$u�<�
I9D�Y^j��X��;�W�@���kOh��u�g~e]9����s�t.DVP\���zY\�C<��I+q[p�V7�6�9%4~h	�s"�qT�%0]���v+�Gv�X�3q|���٢pi��Ni��G����Ǳ'��玑�=�ȹ<2�����zH�T�pu��"<tz��N�ص}L���ph^v����j"6��O�Ư��{6��hPƴ
WL}n��!�Oݠ���    .5Gb���=��V�}8<�a̧�d����0ַt�LJ��%�0$�� ��%���s
m}�I�����H!�S|96�;2�FY;<p����8���%2�lF��|rV#j%	֍��EĀ��� ���g��w��=+�ك��f�5�����I��;��}u�O1��������v�L�h�}����ra���Gs;���&q�<d��9 A��
�p��Jl�}�]����V�F˕�5��y�O����H,cv�fϯ@�]v`�1z�C��2���6'Q���ɯ#��6�~$y�~�4F/2��#���Ğ"L�#6	�r	E�%�F�=��y��nA��8�PRn �;��5U��}�h�?^_~D����Z�b�n�"2IC.��'^��%���5��t���L*�y�ѹ�{zo_=�j�{��(D�]:��_'y�AHPA�r=Ҙ�L�N��&l�"�f鴛tV�o���+���4=��m��+b�k�,n%-�`�$[ƆQ�G-唽Z����!�mJ�:���_{�w�l�wH���M�l��!ă�:��F��>��Q�u7&A���Œ��wik��GF�wʵ�Fh�����WDJ^!;�+&sB�+В"��pp�sQc������x������a���i��~l�q��~����=�I��o绣�c��V[=y��y���HB"	�3���!ʎ��Q�/�Bgg}5�$%��9�q���װ(u>���{�bŴrcﴆ�6V���k.���=�]xaK�>m����걕�LLPl��f��8@�k2{�6-%-�h�
�J�,�����X�+FsӜǄU�����[��:��nX}�Ezjܓk~ч�6�S�UQf3��Q� �3XlE괱[ �'7{�4>L��=�E\�Z�e���dgfR�BsY�f6h��]ϣ���i*��:��h��{��cEW�B��R�X�<�*o�
��N%��h�o�*:-X]��C'n�yt�k�;��x���3�����й����MT&Q9��0�d�=��Ð�'���@��hp�p5t$�]�����\Yi�HrK��s�l����Vw�A#B��0��?7
4�IZ[C	�*%�x	e�e�q&
��|<��H0N��g!�I%��p���A�G����P�$Tؤs����O��7���f�PvIFw����B�"[U�# �ݬ�S��`w���5K��ez]U����o�a�Զ�b5�79B�Y��ÿ��C ��R5:m�s{��-]��[��֎U�����z��=��nq��m+/VڀnT��b5P��ڛ8{��|����$��%a��r�ْ$٩r_�s�v12��	\��Ms�)=���i�rP���� l���e�4�XG!�ܵљ��נ��u0��1 ��n��f���#����F�
�A5��9
h�T�X˖��p�A�\s� ?tט�� a� �r��`f6���*��=��f_y�px렆���v�G�[�]���2�z�LdO�w�����hZ/�z|G�O��\Mi��Z���f�L���n�)�f���8�OCI���x�����*�jd���gv	�O�k�g����ΖV:cƶ#��[����'�K<;U���@���d��.�����}7<��G<�T�v�`�@�!�w9:7���K��5rj,M��Z*�E�u�S��OO8A�~o������'{ Pk��L�D�1�h�܈���Em��Z��[i�5.�Ǿ����y��&������~�p����o¹	��-�v�Y��r-�O�X�4%��p�z1�-���3��m����Ǣr�kO~��-��	�h��	��b�
���I��$1�#��e�y��_R�d�f�c�O���~�Z�Y�Ν#��w#����Z�4@�K1"� ���$c�^=��IOd�[��̤�
+S}d��li�W�R�),��[kKw8J-t��-e �Dĕ�"h��0K��>�z�k���*jK�J�O�����&��� X��]�,ejϕi#(�,!JȐ
��-���@Ex_8QOnAhJ����Fl�R�\�A��UD��MW!r��8W�<��d��-�Ú��J��ea��]5���.��eX�:1��p+(���a�LP*��cv$�hEG��T�<��!���*��d�w�:f��s��8�r�e��J
��$PΒ��239��q6�c��BQ��mY���;��Q'?��)����$���E$�F�'hV�B�Nv�H�=ˣ�"]	��)W�x/M	KGHi�@��|I$��Qî�;168�wzN��]��eiBD%纛4�'�:��^j1�>jw@��Rܪܽ'�l
����8{��n5=�Sz6UT��)Ӧ?q!<�pЃQ�А\�����1b
����/:1Y\T�]���)A@�5�Z ��:��m�Ný�cS�P9W�c'Z�������:"����eĉ��'?�Y�?:���Ӂ+^r
�D���4[eJ��ٮ:ɹ��W�Z;��
�W�A]I���/��$�5�A�B\L�[�e��g�6P �p�S�%���ysn�y7x��v��j�E�UDa�^�J
T�zrS�gJo�ձ�� �o�'n�G����Ҕdn��k��M(�l�,�:��w� ����&��w�ErAܥBxD���I� �-Zj���q><	<,�&�չ@m�@K�g�-��*}�Xy %��v.p� �l���O+ZI�0' ��3d�BK��dQ��$��|x_H@�gwH�bC݃wD���WEf�F�\�ѪJ=?�p�b���A��P����ڠ�ԓ\[�R�% "e���(J�_�qIʘz����#ЏX�XJt�����aHO#�G�ڮ�Y>��0��Qc�(GiՐP?��o���$F"���ٱ0���I��-�"HcmG�a�]�!�8�2g�jO:���	>Y�^ks��\�m�9��FW�"���n4��Z�����l���"V:�S���ɷ��x�^1kv\Y!�����(��K�߮�s
r�g�mgKR���%�RׯBHU�i�����-l�HT�m��KF��M,/��'�8����L��0s1�e��\W嚣Jz�E�=� �.TJ�X+�W�r� ����ݒ��q�
1��$
3�kB��̇�,��9�\*�)���h�۸���$�Y΍'���=�Л�ʹ�fۀ(Sb��rڸmk�C:3"̌29��
��2Np�`���lr��g��Ol���z���k	%�kUb[�c
��-�kW֘� �.�#�Q��O�4[�.��~���29���$���uD'S�e���_Cϋb�H.`��|��`���;��[��}֙���4@�۠����B�8�#�ww���R9'��N��83��n�v���-�U�|���H�#��cX���ͤCl?�	S�[�F{7ю�KB:����7��Bb�UQ��`�a�'î/e�u�9ji�M�!
�s��5��K��� ����2�H6��3/�_�e�S��)����#fk��KXecJ��\���3�vk(,˥#���������!������8^'s���v�/1�x��uʂm�k�c��s��� ��t���wq���_P�V�w�?6���5�}uq�Y��9f�h
�s?	z-*;�!�s(�&��Cmɣ��S��\�����0;�a���xG��@��X���g��Ց���</�����,]�k���ɟ+�ŕ*���W���|���J��|٘��u�Xg*W��&C8��ZJCd�*>WN>�B�!{v�c�Dꔧ԰�$� �e-U^y����m�l�۔'��)O��@��^��� Ӊ"��B�BS�?F�6��I:�	[>/��ś�D��eс���+|6��D&���ב{W��
���Vޝ�Vua
��q`gY��8"WK�!�l�ü٣���|��zW?%(4��}��wևuE,��S����X�Qn�Y�5`�h8br#���B�g9Y� ������餿�����st�|H(�C������t22�}�rEr}-.st`�{È�flOt�����,�a�`�eܹC#��{��s�P    G3u�ݥEL�kY���X��n�5�4���I g&��!�y�ƾ.��#��Y4��Ө�-������G������oe�6e�i�,��w����<qF
�Fa{�k+�Y:�J�܋�5���Y�|V�Owίk%�h���uBtH?;�;[OLlH�M��ݸ�=�L��.�0�hOJ���(]:ۂ�N�1�����I��q�-��쿠�r�cJv��`A�d����s���+������%e,����9h��)�rj�B$rŚ�-T�}o˻��8�gn��R���	�﷊0�!d{o������r�hp�{mC`_�V2����Z��L�
$�~�!^���t�Y��M'�>z����MQ����
�� �r݉���s���)3&�6�/�:��!
���������LYve�]?�6iq�9�7�>)�����f�m���$�bT`�r�h��� ���������Y�˨_��W�|:�HR��/f"35��E_:�I4&f�V7�I�&Ď��b�>��93�� �t:��.��t2ʍ	;�pSV�F�.C���ޅ�>�O��~l^��ɠ�������֣|�S}XB���=o�߭ރ��2�F~��D��詷�o{��?���KO=��H�۴��}74�)�[���=&v�/l���Ϥ4�h�و�G�{~6�]�;����svv�V�����t����éه���_G���'3�\��G��#{�;��{�}5u��QW/�r�~�:a#p�HI�s�/��@�	�@����ږG�R��7ˈU�F���'ڭ޻�[r0	n7m�X�:��g�u���9X�qo_չ���T'n�f$x��c���F	��v7�ȭ�19N�Hz_���l��L䜯F��''�8��H����]^l��r��Fsag�s���\\�]o�n� Ӓˈ,$��:�O�����ٌ;�=�]O�6V^qf�K��M�b�KE�)�~�&��*]'i�K��fc���߷o|M �ֆ�jE �������`�8|e�>LȎ?g6���p�z�lg���/�@M�{Q\�}[{�#D���0!;�'�E�^�K�9��p��y��JX����~��a�Id�l�`�B*qa�#��8N�/js:�з��I�͕S	�f"�XP�)
�e=v�sN=�@�3q�;4b\Yr�.�$/���3:����_���Sڰ4�3ݺ�N̝�C6Q^��PB��gJlI��R�X�m�$�����ƣ׫531�h�=Fm���^���[ah[Y_b�܈ӁpO^�T�*�mC*_F)	���\a��
Ӧ�!��E&^�6�?�#R�7$�dLf��=v���nZ��kk������v�~��׏Я�-4b+?0���.�(�o��qG�a�D�m�?:k祔�@��0�ci�����u�Z��j�"�G���v�ck�a�7?p���	O�f��6*?�Aڶ(i!&Է���T9����O*6G��ј5l�N�.jA��-#w��قw��o>^C�Y&Rs��,�|�n#��"zĥ�>#�7M��{��(�t���~gc���Jq��6��o���;<�)�6��n'��Һp��q��Lح�c�a�-������S����߁�ؗ��	<`�%X�p�&Z2�5��x�(,�ݐ��VvNĺ��:^gȗ���f�zV��(rc�O�ŠO3���Ck������Hb�	���Ol�����H�]�lY۰(�i�㕮�+{q���-ݿ�3DX<*~�$�Qf�cۃ���*�u�suN�W�i�W�DpOZy����d���"h"g׽�@I�C�淑z�i��86n �ܲ@�Kqc��Ϋ2	�A��΁� pM4ؓ��d�� ���܌S�6ב��f�W7�sT���p~��.Ɯp�3�f�.��l�|��&�4lE�N�����А���ү�p1<�˙:�%�`��t���I��qyO��=*��2�}"H�}�[Y�=�:�Ꮝ�2]!�k�q�9:���_�M�[;_�@:��9�b�/�&`��)�H�J���#���,b���Mj��Cj9�ش��ձ"���iv�s[�'�=t����|������<2���v(j˻�4B�8�Ǹ{!y�Uf�S��6�2��$�-!f�\�b��nR�R�����T����+��m&��e�^�s(��|���lS]a�<)Q�^ym��t�ܤ9�eu���x�S�Ō�����S��\'��o��`�#���b7ǽ������a����b����51��A���I�x8���,�Qƈ����AQ��>�_�f�f��DY��4��2�����m+N�Z��UP�#%7���I`��W��K���ޒg��T��LBb}+Ql���F�8�~#}�鷑��7���I:�hU�D;���S��[]������aHJ�H6+�N�=#�ў�3�jk��'>25�éI��tF8�x�|�Ԍ2�Q��O<�&CX�Y��aw�BFy�3����q$�LMn.ǼQ&������e���NeQ��*JN�q�bR�qƧ�v?Ml�\��gA%ja�o�k�4��+�����4�>��c��T1�}��h����q�1ܺH��>G��ߩs�s{����(��ۼ��wUGU��-��n�?��W������S�=Ol�;��]ZfD���Uw?v��*��=������>V�����A|/�H�HЕ>�(z^d�,T��N���7�N�Jd�[�1m�`���f�" E�z E��MA~�
��B޵�nҫ�P-[���/<f���
a�ZMU�I����<���ZC&���k���-(��/�D�[�A�ݽ�����\]<��Z��z�+�Կi��:���)�Ժ�緱g��*��n�
ZQ��?dm�����}C��FM2_��[�2"��涭0{Lz��
2�wuӉ����
���7C/EB��%��2~��{�wNH��\��^@��s?�������z<��l"��T�>�7���5��s�v�����{Y��#|G�Ry�|$��!Qa���}��p�3�����ӦMq2B�it�����X
�{�8#´���	��J��gVJ����;3��ښc�"�/:���6�z��fٰ//�-ˢڒq��x���\�"+����F�t�PI�ӳg�6BՔX��zUPb�+N^����H�w�+�hֵ+
h,�ls����<!�]���(pU�7؉�����6zC'�H�/�f����8��+�g��\��U��Z�$ʓC�%̳��&%&ݎWK�ri�(g�<y�Ǿ�V�GG�D*t��Z��.�^��"j�.;��*�a�! ��umK��MO0!�U'$��*����E׃VZ�:ɣg+ccH��j���ID�E�K��o�=Wi�:�L����/�ցI�2��o��XժDm����y�X�D,��)69.1�N�$��L�v�e�N���9�qh����ׯ�9:��1d��z&W�X�;%)�
��&Y�,�*��"�L+$��EK�,#/���k�E7�-�a~�8Xe�Bhzդo�ݦ�iU@�>u�;�"�)b/���M��ɘ~��'��Ga�0��%�1�
Eۀ�1'�p������i��1g���G�_�~c6K�qN��l�W xڸn/Y�t��z!����n��r���P���A�����9gGs�Z�ߘ���x�a��g ��ZL��4R�X�w,�9�bHH���y�f�r��b��fF�y/1o`h�7~%��-A�
 Վu�Y�Tׯ$���Y�]�o{�;"o�Û�'�O��\���it�s=��S��SI��H�t�C5�XHm�m��"�G�ΗQ�R�Gu�\cg�l� 0�����8�8�%m�jcV��i�]��_�a\��E/2#�Z��^�e��j4j+i���ڴϜM{r��ϒ�mF�6$p�]���,��^��|�x�=�W*��_�]��H��8/���)����5UKv-��%��k���ʩ˙.�1�X��85�kK����6�fr�1��'�=yz3������'g���1�})����[�P}���Md�RgD��n4�:���F�'/��H��GP    ���<v��f'"p45��Od��v׵_L>m��W٠&��E�,I���=ωN�7��ҳN������fg4t�O/�������Q�<.3]�h��x��a��tKj�~~5�������������������k����g�j4�F�MO�&�y�ǺY���XOI���-B�S{��j�'�݁� ���@g�ӭ����n�������P�zY��ӓ��t�mg�
�p�Tvw�vN��O�[�li�QY%�� =��3�@U����ԗ))�����h�����ޱ��:�ph��/�,#n��=��I�9�ԏ��E�\ŋs���W�?��^�i/�H'�u#X�d빖����%g��`tbU�q���(5y㶏��Q�<ى	��'���F.��-n�A,�	�)L�Ԉ�����J۷O�������l���sv͔=����=�=&W~�i�c;q"b79�՝!�ġ�>���MN���J���w?nOw��Ѻe�W��t�K�4��w 8W�(Wm�ΫS�7gCG*dەϳ�������|����^�o
�k~6"1t��m���0P�F-���I��@��6��v��x�oPO���^o��D�/�,J���h ��.��5�N�W��D�\�cw�(\IT��)�
��'�H�����c���C�&m�s��,��g�5�H��mG:5�<�_�ס����_��^D�uHx:���+��������f�߿1�(n�a���o&�%tR����6$I?{ֹ���G����7����[Y/G����Όǒ�:���;�wX���z���;�;�m)W4���"�i9o���t��\y��A	����n��y��o�������s& 1��T9�T�A�N��&��ܮ�yGEv5wNhQ��gqߧ	�~%�� ������`::��֮6����FJ�xcV����N�ξ��|�T�QbVπ�i��BW�0�ߓ+`�M�2��pa��F���^=�|''n�.*�E��}n�k7lL�EF߬�Ҡ�ƒp��Tq��踀׻�97eO�I2u1��r�w���1xm����_e��g��ŧ}��s��ׅR$����J�Q�yx��@T-�[���KꨜU6J\jri1�gkڙ�Y4,�*8�]�u�R>G�
�pN����R�(�ED�6�
�Q�Yk�߄Iw�6��-^%�D�^���\'|^0��Jv˸�n�t�>�����yA�8E���|WI�Hy����]�~�MK0��$$D�օ�6�Ѭڴ���b�O�<����Dd-N����S�Ѫ������S_nϼ7Hmg�)��V�\�ƿ6���Om
��ˬ�͍���C�B_�0�7"���BB�ݿT�"�l`W��Bc����K/W{�rp�~�5Y��#�V��.䁚�G�B:�q��&�?<4�����j�i@sZ�)��c�9�Y��+[�����CS� W��۞6ca��䍁�	�i�`�N�����!)e59���O���$�rѽ9��q��wAaO:Vs�(�*�r�������L֯D����B���4�)���f��CX�9��C���9�1F��Û'�b�U��^��Y��7B8�@�T'[̖��ȱ��m�9R�lŦ����bb�C��C9v]�jW}� ����ҫ��
;6��t�2Tߜ�&ʉ(T�q:��蹗C�܈Ե�짩�C�(9Z��c����a�۽lKn,bJ���Tv���໛�ePt��M���є��N�y��7;�<������=����~�^>a�u�m7n����x2�J<���� ���n[c�(7���p|��Pu����ɫa��l��DZ\�~��$%k9ۺ\��4`n˪o��L/�����Շ����`R��ϑ�$z�?�}�	̃���Q܈�=[��kҩ�?P3���� ]WI�Y����F��G��듩T�D�����Z���|�=W�����g2�e���QS&)865^�p�|��=:��D�0��=Nl�X�ĥ�h�ĸԂ���l,8�$	��=x�������=jb����[�����4�&�gD�@��S?|�z�AF��쳩�����ã�4��~�?Y�`��4�}�T^������3�}7b���YR��BI�qSN�?V�!��n?2%�:�O'�31�q5��Du�wHi�������xSr����5��e�R��NM 9�!�2��U��/���ݢM�Ε,z��g�1�w���CH�c~>?e��_�S�8N�q��ɀ�Fp�۠�@����1-��$C�1�#%���� �6�=�)ʲy�pE�K.JLҤSk5���!���E"16m/��Y�&u�!u�E�n�����9K�n�'���هx����ǔ��Yq�C���j� zg��kVȹ�s����"�"0�D���פ
�4��Ƌ$���Iդ�J�JFsѩ��%m���OoGggC���4!r���ZQ7:2�N�Mm'V뼽H��i�.���9ຼ��J��6��3O����U^�R������xt&T�9�@�l�B�"2!�Xw������V@x`�E�M%�3 �1F��{,������1��cD�S ��*�ͫjӍ��]tӮV�\2�!�L��AE#��ɑ�^��ϑeC��0hGN��Ͱf[v��6m��>��}�L=N3�xu�@����z��N?����e�s��H������5n� �K����"�*hܩ�/z��[p�k����R�4��61��b�%���p"���[�6;�������xN��bQ��ITA7C��P��m�[VФ���gP����ѡ�y��ٲZ�O�q��Ą�І�� �H��X��<�2�Ie16�5�mJ��u�\� i��̾V�N�w3%Aè�z|�rY�N&)@��;� ��X�6(��`�KT�2����S��u'
��&%���?ץ� 0�&�p+�١b�M���c��ҳ;m�O֖��v�Q�!�3Ś> b���c��z�X��m�	د<v�C��!��H[)&� ��m'	�%���Zz����W���V�B��N� ��`�q������ �R]�����`����Rnt�N�Y���h��?ͱtx�by�s��k��uWE�8h]��qĦ��Τ�l�R�`GO�e
F�uZ0DOL5H��H��KK�{i�oŶlB�9�ri��g�6G��C����ߌ%H�D�������~<v��w6�viO��E�+�ι�C�q_KC;�/����z?a$�3�������Z���Øp�p�Z
��6�D{�~i����&�\��ʕH�=��K�������W�9C�y̆�Df������R������+�'j����aق��n}����� Yl<���p>�/b���$Vlu��n����OV~��k�&ݧ��m8K"�9�Z*_T���t�p�vdU{R.��}�i��#�l*b��l���Ob���D��t��H��n�X$�	�2���DUʑ����l���`�I7�[�N�Fd��a3�Ўol�����O=��7�0�^^�o8%r�S�L��	l��Hq7vYǰ��a���X5�
��%'��~~O�?�p��{?�u\#l�C�"�L�%��q)��}��J�{$ȶ��V����M�&���Y����[���jK�f�B���ۏ��� �EU�1T��`Se�ܧW�ս#Z��W��N��is-�ٌFlp@�������!��p<��bIĤ%G.�VG�Q��$\):{�s�t�}G���-m_�Fj_�MB��3�WPj�������Qo��^�vT��D��qB�ITO���ʴ{��6�Fe�P=��Gq�p��8�?�ӑ)����؇?���q��2�'Ʀ �xz�^B��L����}{���ǯ�}!�?y�?��z�^0u͂�'�&����پm�nS��tF@�3$j�����M��� ��+�wC0�J�u}k�P^�Z�����k���ASt����^z��Ȏ( i��<L�܉����#��U�OY����*�R��4�t��]�+)e�N��Ns��    6�F�e!��+)a�7m���zzsu�ABd��uO��i��BS�='[��N{���J��´vj�Q�443S� ��Lw��5���S9WU&m��!�Q�ꇼC+�J?�:{08] x_��#:� f��!���Q����`4=�NFC5�>�LF}�d�N��Kx�NEv���'������e�W�F}Y�f������inBض~���_^�lJ'����=Do��y�	���y���}�ro!|*]�_��R� o_&U�Dq����{��!�X��$�kO3��h������BdJ;��"�B gxq1خ,b���0	�$}/Kco����z�����)/j����	��
��g@��!@pa��������T�|"�$��mV/��p4������$�b���^�E.��8f��D�m�0ƌ}�o!P s��(j���ۢ�U��1P�k����C����o��(�n��>N�M��;�jÍ��z�Cyt�_��=Q�*$���,����z;���'ςP��a��8F�����U�0;c&�1Υ�J�eƜ�Fsb�ٷ�"��GR�pۑ莳���Z\D�
������RZ&�
"a�h��a���MJIb��6�(�t�Q(�SǬox��h�s�F����.��V#�-5 #���Qߨ�2�Ѧ����DC��V������	=#r�7R��=ۋ����\�F&i��u� ˶	[� $F�@!ɓۑ"���W*��L=��	A�>G�(M��	���Z�NN�+���^���B��f�i�� N��]�V�ĹZB�U[�i�.D� =��ҏ�r)���J.sJ/�h,�Pa 6�U�*�n�/��pxHf��w^o�&���WOVza,����΂�k�<�H8�$B�8=TDDFm��13D�	iy@��U���Q+���(���)0�b�Û�_R�-����ilZ�j����Ni��i#�����JX��iL�[A3��^u9�!Ejz�x�� U[Lf�Ki�(aI�/t$	0{���0� Ȯ��х��������o�}�M]�M2Q����V�����Hl}( 3~d΄�(���m1���k>��~��{�QB�,]�Zs��]l��(M�i�+G�F�4F�33O���]xo��/w������I/S�sJH�鯧9+dB�4�rؐ���^D+,zG���q�Yn���|�4@U��Zz.zQ�����$��������IZ������F,��@��e]�ݙh�c�>�%�^)���6,M1S)�		��J�)��pg�X/y�&8�Hvb	��]�Rѓ������T���u���:\�4�N�j|A���c�;q;q)94���0�!*Oܢ�$e�ሮ����Aˉ��98+��Ydwg^%�[�Yj�[�x"��\�������� ��4w���P\��8�o2x;�U��:B=F��6i��K�د�׊���3M�򓳍�VgG>���;��M8��'�*�	����
I�[�7$���P����
����:P��sg	Xz���vH������x�\|3��T$�߰Kʧ�o�~x}�9��R�!���<_Gf�ն�J:�
���rxSl"?c����W����}I(���$�0+n=+}�RW)�$�:7�`��t6=�RvwU��|��݋�v�D��H��s�ة���Äd���
5'�f��@v��0qI���+d�4$���z�xE�d����������x48�Z�s�'eB.7��Β?�������ǀ8.��ܟy����Jk���Z"gk����iW>�RT
���t��A%A�yi�n&�cb��Y�p�^}��V����9�i)D%hMQM��w$�p�q��j��]aV�_ٕk�׷gD��*� h[��|.��=�\��EZo@Pj�u����y��:�������Q��J�2,*�����"l°�m�;lXmPANg�ϐ&�����eG�3KoM=El �b�F�0^$��+X��`�fDeEFFD".��X�-�䁽�u����_�����#��LJ=��7���U���\���Q�%���@�Zhф�I�od��%�4�z�F���%�`O�BFc�#9�v��j4�i�Y�>{���R���m�x�~�5�?;o!�p�d����=>���;[=\1NxѱY]Y%ޕ���#J�nY�+�v����/hl��1��t���;���Nd�أO����F�:��)��O/�qMY�"�u*��=f�:�ܼ&<�>K�ʏ��oԆ�)�8�Ƣ�Ǒ4T#�͢����Yp�eKo���
� �����P�)��vi4m�W�2���@C�I��w�(�P�}#,�3����V�}K�v�����Q c��X/�8�&=�SwPD�M�ai픺id��pu1������[j0 �w:�/|�@;����^|ڳN��V��D!/�7��e\�*qC�*G�� �R��4���x��3����ڲ��|�P5�bSe �2�e��K�?�at@�
2�����Wa%C�:sp�Nh��F�J�d���@O�$�b��<��p����X���?U�͠SHi��e�7�'�#7g��X3<t�|����w���J��kH�fgFJ~�F�L���c�U��N�|�664
���݉�0��mG�2�*x�ab�C����r�o���Nhxل_�Ki:K��B���7 �A��'���\�a�R>�;���D�-|�	�������s+C�Z��:c�����C4Ӻ0��<��nd����M�9yք<��J�yq}z1%�%ķ��Y�+��sk�F�LWV��xt���F���3ȣ�/.߁�:�L?:Mm�t��O����h6��b^jZI	�#���T+�.�����W��AF���B����NnVj���E��{a@�Q�pQ&�M#�lN�Ue��,$��?�B
��r���f3hc��gV�~�������Nݵ/�t@dh.�e�-��EG�S���^� h�"�m��П�Y�v�:���?_�(��=6U*�Ie��Y|`~s+����nK��)yD��'�����p=�^��H;u����������aaOLn�)	�b_
��,���}X����wm	��N��~u?gE[nf����֢��ٍ5�m	9X�=�5��_�:-ß3
I<���3%q���[6r�������+�:Lv��j��XޏUs�R0�	h?v
u��O����7#��_�Zܞ����� r��`[�]��2 iru<I����>Ȣ���\�_l�a��<�D+F ��8�G5��L����� }�����Ss��Vϊs���ވX�����njN�ډۓys�1��A:��z��R/�>c��Ma�!.�_.����´K:������s�%���e<�ۤ����M��E�d<`di�Ѹ@C�C����Bet̀�7i��?�Cb�����K�aȩ<��v^��V1ev����^�Х
C�6����>��ɝ�!z�?:S�em���g�g���p,^�*\�G^�	+��(/�j� �0Y��yʬʍCѽʎ��4t��·]G}��\i}يh�i��>^�!��6������骒��0Cɸ�/4�*��7�B�U�XH;�9` '��X�y�SKT1x��(��P���-N�!�/�O��Z��|��A˭�&��?[���!dy�`Rj=V�.&�C�����VF}����t/���nw��-M̟ޏ�u*OW�1��A�Z��0���T*<P:���q���vq�� ��7;�%�����{eg��X��d裒>CUO�>��֍5���5���4���:T��FϢ�u[����O4;��Piѹ��IL��ϪՅ�O���f�$3J�A_o	�G�1������:'[���x�9�}���s�+�K��`����Џ류�iA�����
cⶊt���e7��h������M�l�(B1ss��*���^h(�y`��V��u"
M�OgQ�\�o�5�� F��(�� |�zf �^����x|4���!�m    �w���BX<�M�=H	�(����},na��Lߴ)��c�Q�Ȇ�� b��m;����z�`�@\nt�0I�[�I>_�ĩ~�����+��hS�0�$�LD�V�Lj��$�Ѐ�%��O��/z�΂���5��0���9��$Ȉ�]�:��~k�>'�ur_����%��Ը�V�ϏS��J�[�ׅ��
߃�4?}���%��I�@���F5�����|�Q_�L�`��N����k�-=\au�� ��L�Z���P1����f % xmG�eg��2��~�������v�D�Uq���� o����?�<����n�3���:~8qB���K��8��5&��`��F
����-wm������N�}߃�Hվ�%�T&��=����|H�=����W�7߮��2v=$�lcy�T#p^0� �e�❇X�,��L������D����Ty�KуQ�5Xb�ڗ�׷%1�N��2����5�o�qv0Q�+��*PA`��|��q��>�|P��P[�XZ D�\[ �<U?*�f���t�E���M�7���������u�MA�߅��I�I3�qur���r�,A��?���ͺ�Z��(���[�n�ƴ""�y�����@§k&w�3v@�����x(��`$ً�i�LT����lr�*�T��ƞ@>�y��7*|d|t�J�'����M�X*E8��fpQ��S6�#<V%��Dx���]���I��ph�ϱ��u[+�WJ�������iK,<"<< �BD�iUXø��3���h�X���.�w-X˫[]k���uԻ��[�j�z�&Q00�ϮNο'AX�J�~@S���"�E,@�\V"R�،-꾁��榀2ȗ����q.���u[V`u�"�ڞ���dL�>Up��\�L����|���� ��<و�m�5�I�����q��j�0���@1��������#,/pZ�)3n6k�EsQjo�Iͺ���a�<��тMq�>������7�A$	�\�dA������ېQ¿�(X0� ��x�j�O�Oz�*P��~0�q߽w��Ͱ�
[$�PR��T�J�N6n�FE==��v�@��uPs�-
=�CT��=�|��r~.
�*�riX�����/�zV��������[��5N?875��ԫ���wI�ϾJ��p�>j�,����)d:24?oi��݇�C�w U�s�"�,
Gj0#մ$�M��V�+r� �+MAL � 2>�2�у�0���h�:z�]�&���0�ص�t�N/\'\7O�z\z+�#I�ΌEK�C⍊.���R[Y|�N�ڇVK�`T�-W%{^�n��G��� Q�P��4��Y�P|��ؠ�q0�:ɞ�|Q�x� �S�����NT��D='��C�P��U�>-���V�z�6`�\:���{��0	�Z�P!��IJ��`�-ϡPA��6��dH��m�Ĵ`���\!��X� ��냉n��f0�^�̉w�6Y;�M4=����:��={{y�����0l�u��e�n=VoM~�#�\�.HCa*�:����҆�V�7q���@#�z�7�*?8X?�?�j�����x��1�T�~I�5A�@ǘ���f>t��<gY����8�>���A@*#L�'�uig���ߋec�->t�΢�K%� J� �IƇuq���P��p8�9��l�X29R�e�ò�<|lo����p}���_@>Nk��"b|zh��G�M<���贲��K[l]�M�z����/?Ȏ��ER[��ˆ�*[���C_ĵ���֣Q�C||�ƞ�ϠG��Fo(<�)��}!b��������^���0u�9�:�Q��l�Hd�L�z`�۫��1� (��Ѧ�pLM�Q�#��4�]Im�&̷�>?� ����}L��������X;+�J�>;� 荪0OC����0��
�Ә@�Ћq�H=��<A��(xP�gZ[L���QnH@�v+����2F��W��)����1�{������{�9b�8o��v�㐡�#A�V��f^�xW�Wq])K�;�a���!�&#�zCpi`�S�D���m7`�%�RlxK�}B�كŗCu�1x>����;�$XM��ͽ�I��t��1�a�I���GC]t����QiN��.Њ���L)����8��lU�!�AA;ğ�i%eN��x:]<�׈j�?z�Q�_�n!'_8x*3^3��?G���|x��d�JS�4(\ͭс����=��;V��|!/!n#+�y�rڞSF�\�o#��B�C��ڹb�M?fʚ��FU$Z��V��*��7�C泴��!��k]��^}�����D��,�P� �ڊ0�zn�>܊HJ�B����;���CEʨ��0 `�d91�����>�,��(���U-_�����T�<I��J��>VK� D@�n�4�^��D)8H�Ɂذ���0��|���r��D�{|�����h��|����yO$�P�0���a�3��d�v"?��y������S��Z�}���z��ĳ+N����-�y�#�xˊ� �%��=��!n�>M\�3?�����'���&][�$��QϨ�*[b�c'��q���X�K��|m�1��Sր0u�(��^�et�K�*t�H#q�\�7>�J>}N�	F�F��.(a< G+Xɧ.�����Ǎ�DN��G/�,O�F6��^���퓍<�����<����:��N�e�UdS	_ݼd���-��_�>$`����H�ױ��xVq�5�o�>"�QR�u	YO�&�[�\ ���b)���ڀ�f\_U3���xRM!Z�sX�e�mk"r�kW��ۗ�ݾ��9��@����͵��:E��π��ˣ�
*[6� ���
R�eA��KnM�����NK�$���q�
�|�bcY籘u9A����}�p�I�܎	�I�M�lq$�IC����	 ¹}��x_Ϭ���/p����>C@�xZ峹�[#^��\Z\��Bw'.�V,rc�9�҉�p�>�{4��J`?�����Z���"�h(�Vb賣O�7� �j�ڣ�s�y��4Rlܞ�¾��DJ,�����ZtW(�T�����q1j\��rh^"���'N�U��f�Ǚ�j�6���(���b��������-����+�M����Ф&�wL�^�cQ��F� ������UJ��j�0ƅQ���q#[ߤuV�&���8���Lfv{a��U�(����;��[�˸J��$b�(JP?��~�">_��B�v��n k��1ʈ��Z��)>5����t&@�$�￿�s��&S9pX~�Eԋ���oX9f�d���`W֦��նG���M6�\���^xyr���IV.I����;H���c���}.�j��Qa�R��됆�t��4U(�Y�`/t��B���m�Fd��&ۚ*eFǖ�w}4�$L���hM�d,_�a�$����/���Sʇ!&s��&.���	��z_���9�X+��_��o�^�<1�eXkt��S������D��JōGs��T��������(�� z���9J���k|��SPw� �Ǡ~�4@�)���� +h����=έ*&7G��m����=%h�]]����>��F�P> ��\%�� ��-)���8�6�r(�J��i�µ�am�H׭��P�e�Jy�=�M�B��RV�F*�R�>d�.,K�3�Hr7	pdu1ۈ�R��W��&�ss4�e����y�|��^�g;z������؍����������@u�1[�V�|PO��8A�qT���T������鴚�93;C���W����x�ī�����B�q���X߀Zx*�� �@O�۾���	TV劈
(�K]�d��&�hq����{X��b�bW��~
llJ�b'�lgF��5��6�I�)7�P*{vYIT��:� 9�ݭ\�RP!ށ  ��e߿�Od'��c�6B����l!���x�2z�\'iTi-��Wm�=H����cF    ���4	pCt�����b�l�h�|E�[�<K���>��8�Qc���+eq��[Ē%�t����ݑ{CM�.�2��,���pۃ��7�P���o4'{�O�5C;oz�wW�gSt5c���d��`J�.�d��������1�J�	�;0"Y��e�,p�k�.o�vh�.vH��E����)��������%��˕��W���3 �����_k���`���M���8Y�D�e����I�`�\_7'{	vr`Vy.��1j4�D)�w ��"�˵�`i��ӿl�Y�Dd���3�m��D�U]���-�/PP�E�Et"=xaS�����UC� ��� �c ]��b�qG�"�Э������r�V�@�=$)�^/�j��;A.�ip ��o�doR�wڕ�"/<�-�1̵ &�ڻ�pc�V��P��R�_�Z��4"L�vQ�^B9�R��߷b���f}�Q䝛Da*j�i6�M�'��Rߤ�
�!Y�%����	.�w�FZ�\#��ǿ��@��q��Dmj�p�]���	�* n��)\�Va���/����vuz���SƼф��GQG$��!��n8�:6h����KX��cm)̊�2��"���2�]�)�]��}z�˛2�]�Tw_$w�w/?�}�8C�n�s��oQ�q���8�`^hOa؉��rvqv�A?�����e�}�A���>?a�DZ�*Cr��XB?yV_��o��0ٕ*�!��G� �	�r�B��.�(�[��V 4�r�~)x%�P��h;��S�ymm6�ڐ!T�N�U�9XS�
uf6z�/��J-[ԺiQz�ǂ;�RZ2�D7q�)ex�0�M�C�	���2�%�a�Z'e�����뜁|L6�ф��u۔�����*������t������k&�1B��(��=�L|ʰ�fV���]x���PY���=o����!���˷��#pwuv�����Ҕt���G�^dM��q� �����pK$	�Sl$:�cyQ_���t+�zr�Z���T)?��幻:۫����}����0�l�$��v�u���������>s�T���oC����/�s�N;Fy��S�M^�iʌ'6�3��ó�h�{d;[[eHѦ�[���țP̑Z_,��{����it0ıg��_4��D'C����(��x����zMQS��L��P]l�#iA�/�JNa���ɱk΀��$�qb�d����y]�M�z���܈f|PC�����Df �	�ҾA����2�~�N?C,���LsO�mF��`�GH�'�������e�	��\�W(u8}�T۞��س������m�2-8D�eP#{}կ���g���]�����|�;�t������	zD��"Y"����\D�j��whE3?�l HQeO��M2�#��T=����9�u��|OIXm5�~��f�����荆��?��Q��,����mY57����cR�@n���S90ר��^�B��Ӫ���kOģ,��X|c���8)����(��a�.RVX����~����� [�]���?
X�'�C�* �0O�;�Z������Tn�b�J�k/�{.ʥ<�����c(�ه��Xe���@Fx&#k�k:�E�_�j��s¿ ���4���vs��Fڇ�c�n i���	��FCh�#:�!t_���ʐT�qD�PD��xwrx��N�?l4ψ�G +Z���}V��72��J��#~��7X~�a+�X#0��[���-���g
��t�{ϽK>fm7<����)��e���RvNw�0¤_���G�4d�K7I��tdD˕�� {D�s�Ƌ����,�W�{�8j�>�=���o������G��1��i�sHk���b�x�}��УPwd��MR��mE��~�S����wA�Ğ�RKH}w
y|�D�0hJ_���~�Z�,j�G����i�Ě⸊*:�x�;C��	J��~{�\����=g�Y�<����!��ZT��N}�[�z���G=v->�l��0�;2GZ<����|���AŷHy�4��j���|�k�}�X{|��NOf���A�$L2��当G=0N�1�������z��(���vc�>}�}$�Cl����^m���-=�(:�hOr����;�@�(ewIٖ]&nM���>-6��
�0���8C�fȳ���I?�K�����,�ÀG�ʀdq4t�;+��MC�]�T����x~��8��<|�1�r*�]�x�,w��v��\ďG�.F;��"ۺ�q��4������1� Օ)��:�����s����;a���GʇgEf��£¸����}]��x�g��7�w@�^�L�����v��〈
�s� �z��.��hS�V�k��&����$�Ja4y����GC����-=7Û��}e��w��� ���#�=3����¤b�c���]_s�_�1���� ��D+J�n�̼�!��->�id�P|�(��_�i;���NNg�g��\�zp���m����[��^�.v���t�A�BتQ(k�+:4lTt,v�0��.�|/���Y]���Fn
#�8weP|fL�l�3F[0\�0r^���P3�f��
9"������>	5 �8;&k����Č,�Ȱ��ޕ3�"k-@�u�A�L8��oX����}5\����dCh�(�N�;�<Y?yk3n&Zku��x/Cr �6���R|7t~\ܤ��e��)��'Jհ��tM���y��]!����]\C=\1�4�NIs��x rh�#�g��E�?�,���N��dm�r���+2듓�'�%�zUf���TOVX�����΋�ZEk�F���Yzì��C4��w|?��Ě�]�g�š�O��<ǥ^V7��LÅk+��^t7ߒh�G>�=8fD"Yv3Yp��� �{��'�b��jorݒ�`j{]E����-B����r�����?g��>��'�~�;�MW E1�j�G~h?Nsyp2��/�&bu��6A��kk,2^ͱ�L�4 �j���{�'��Q�M���$����w.s"��*�n'�ز�S�t<<�.u4����z�"�󸰬oln�nA/�/�&�V�0�碌co���~����߬[Vh���<��z��A�������������Vܤ�/n�"���&��g톏<�$�:�*/���FZ���e[�����&�f��{'��������￴�����q��T��.����\�ьu׾zzhk��'/=sD��տ't��7���n�~%�wi��ߠ;aSן�4�5b��ـ���$)D���,�ݔ�Gk,�9��g�����a߾X~{_�xa<?�x���o��kd���x3���fX�\W?������]�Yΐ�ֆt�o�����6�����n�d�{������>j�n������M>E0��C'���-;D_���䳓�_:�0���7<���1v�ݯyZ��:����h~셜Ĺ�ؿ<�����܂c��=���noJ�у{vg43ޕg*j�֦��Y?�nX��k5��c�rP��� '0��#
ɡ�DVj{|����/�3u֔��dڛ��ێm���m�|ϢW�Hj���ŹH��6aS�,{e�ž���(����~�N��Q^Cr��e�.g�*�F��5�9yx�V��H����������Qh���-F�\@�3��*$P<�����Ȋ��9�qy�^@��H�!����U��rh�uY��.<�'Ze�[g�u��f���/�G$ ����@Z�5������%E�����r���k��=oW�vs0�L4��aਂ��C��ܦ����f&*d��?T0F�w%Jr7�B��l^�
}}�2����Q��e��<���s�nA����Rh��nU����,������q��_mʆ���LW�;i�S��#�	L����v��E�>��j�X��'�\�>R+.��A�;�*�师�2�/auL�=�ȣ������?�[��1َ
�FI�8,b���鰸�}�g���    2,�>��%���V�I���.G^v�G�cer�"k��V���T=N@On#��Aq��ĺ�㮤��gzO�w`��A�{ؔŉ�Vb�څ��F��<{O�`#Sb�T�^�>�Iz �J���HQ���-r�ε�B���V۠����XV^ǜ
dUi��Ha�d/{kT>0N��DXJ��4�J�Z�ChoT�cԺlـ�(��-*�Ț`��S�䖮���O2x����k���J��]� �,G��9�(�P)ԫ�mϠ�~SV��&��!�vz�@o�,���	�'���>I9~���}��lz�����\l������q��V������[Ƿ�2�b��񨳕���z�z잼�?O����{��N�/�O�n]����S��)w�/�N�����Bxg�6>��߻u�����N����d�OFx"�~8;>�w,��c�+c��1p�wew1�/�Ne��}���[�ڣJ�[���#�WMΓ��4nU���2ȓ�T�t&J�V�ldY��8m�D�w�TYR̝�D�WmZ�wc�m��-ӂT�M��,�,>D�I���D	-�s�(-�eY{�Hp�|DdͲ��]��e���'I�YV��k���:��jR��v������8r�������:���%{��72�FƧ��2��#5����r�XZp.߉����M�󅓧�e�o�;E6� ��#d�|�*�XF<^.�4l�XZ2�������2��6]ˀ����W;<4�]�B%�T-�=:d,�]��5b��Y�DtM�c�?���%d�]S�C��چEe�R��2�5@�8#K�z4Ψk��5I�1�v�Rv-f�5�_���D^����X�Z�c�!Ҙu�2r^vc�_�txNa�V���N�eB3rx�lg�78zJ�<�-Z܈X�۠���*���]��r�J?���!7\�����&Y���#rS���IW.n�hY:�����⣼�*�%樬�c��ƭ�1�y"�����o�GTd���!�l�,�})�$2k#������.c�E|Xt��x���W���Hx���1bhT�L�N�]n�j�?�5l�2����j�F,c==�^w�^׮3���n1k#ֺ�@V��[��r�0|\�I�P䲒�'EN��<��\~\�:�L��x:��2�t��KY5Ȏ
K'�G��C"��ņ<���5ٰ��;6�������Z�ű��"خ�Z'���x>�Y��s.�E�$Nu�7ww9γ�u�ȡ���%�ȕ:�e�M�}#�l�"������897	7Zץ��V�.#��SB�E�f��r�GH^����R�A�wȱ��#�-˝��F��r���!�Bǅ)�AYE���)���MYt�4�݆I)ߗ�W��rS�Z�X4i����k*"K�NW��s9��(�	ft�<�"�r�]�7����k�U���BУ�18΋���%>�Y�FYr��Y��1�6-!*:,8$Șm��-UO"XsƄ1^��M��.JRQ81�B�&wŷ�jo�劈Lh�����#,r�s�E/Z���uͣQ���]"R Y�k��e*"Y)��E����VX�+��5%�ݏ��ɫY�9��ՂhƼ ]R�HC��Q&
3�]	����T2����<J��~����ިn�:!���A��c�{����!����"(�ykJ�rc戜�.]�@�v�����&nB�f�O�G��똯�;Lq.nr��E(�O�Tt��{{sg	[�ɖ�	vJ;)d���2i�F$D Qܚ��.�j��u��ї-��$r�`+y�:��-���L�~�}C�4)�K7�0���b��%�k�clkC+ɔH$V�\EK�"�B�k�T��Y����s�����U#�3�t���]�[d��v���)���S@�åڐ�m԰��	[�ʂ�Xc�je������7V���j������Ev4r|Es�8��8|�u	;PN����:V� Uf�m	�SJ9�М4��>A�dQ�Y�������c��~� Q��l�aoehq�C�|��Z���H��Q$b��仸�"g�Um-!;f��h`&�4�Vd`Rd�8c�$��\!ʠR��N�g][,�L��r�'ʄt�@$m�bPJ� �}u��'״����P%�:�o��宨�*� _�]otע9ey!��͍�M����rm]�
L`�x��slϠVB�RT��0�θ �%Sr�p�pP2���v>�]�f�na��RbpO���ZfT��/��Y��a<4���~�`�Ҵ�'%9&��UKiT�Vx�����B'zY&O7KDQku)B+�S���q߅cy����c�n��\�Ƅ�LN5Op�Df��U	v��'	,&\g�&������	fx����ZG�� �b��p���}�j�YH5�!�y��R�D�a�IL��V��z�,��_I*��t�xT��p�Kk^�AQ��b���[Ձ��rq�r���1F���5�<��hq��x�l��]����U�~��G�����F���j�	W�v"�����N���~U���Z/W�v�չ�e��_c�yYpE���2h�X��>�PjQ�(2��67H$���v���L�L߈JPHޤ6_dG�cY�d���* �VRH���8�9������G�'���{秧�.n�!�����&Y��q��_���:���"��z��UI�^R��!��js��`���b�A�"�#����}�e0FT䀜�O�,nH�^#2��Z9�pU���',�ܤ%�]Ry ��O�ÇVV���M_ŨeMH��u'�R���@	��_W��lH��ݜ܊�ڒ��[���A��>���X���k��GK!�7G���s:zNf�,X��kţE�V�ѡ!�8B��gH�Ĉ���z�[��fZi���ȽC���,th��� JU�CjH�R���_���l��f`ad����?���FM��&V��>�p����.�w��.��1� ,�;VE%-j��h8�H$�HC�/(�d�Z����KG�g�2��H�����@�A۲�V�����O��T�6[���l�LE�#�LƸ�`������?���E�� �h�ѯP�2��$K�''+���&Ɯ��}��ˀj��A�*vd��^�r��� �(wG�[y�aO��P�|�e��0�-:�=�G߶$�DZwo �.�7�99��R��A	���y%�tJ�pE�e2� �z�v)	�L�"L���w�[��_�%�fH#�D���H��q0nv<m;�����%�$�m����q
���G$~x��(k$�U!q�.ڠ�y-�J�VPͽ�i{h}��3��g��EZ�&G�:��S��am)�2��O?��Y���tT�wD�m�ip3+� 2�l?����`l�`�pD��mL�*�?,k�\��/?,��ۘD ��i�U�ٓ�Jb��R�#3.b��>���c?+������9?|�6zK���>��W�bK�r��D�>x����Q���X�(.J3�ԕ�1��v�$n��;&�r.�&)%k��KV:���#Z���?���?���^��*��=����Z�bS0h#�_�۬B�^�-YT��j� (G5���EZ�y�� .ǪE9��ɧ���C������/K�ܙ�lwQh��w?�I�T��K7���*a�P�*�@�#s����Q�~�iﶼU���'1]�&�8�[9���=�4��H�~^~���敳��2O�A �J>�������Y�ӤF�/����Icp��$��(���	d�ۡK�'s����T��� z��wD#�z:*��mإ�^ѷ��s3MT�XG9�*W�)�����Q�rA>>�'�w�X�Crt���%��ճ��h�
�-^ �<
�_�lRR���U�$�k�peZ�hS����Ӝ��_i��k2�)RСd|)ڐG -"?�,���XʱC2z(��Zɴf�(���z#S-5���a��� m�R�\�$���D�1Ci�������]S��� "#͎�~����&��X5Rv��(��Tˉt�'�Å���$�    �ZȪ/Ǽ����Ᾰ�1�Gt>���z���@�%�_7E��X�^�cji���+W��V�<�dB�>Rdj��)���.�S�ƈU8��'�b�� ��n�B��e��Y�@�z��MY�A�:#������d�Ɗ���.,�u��Ti|�ss��-Ƹ6:��vbTi�0d�M2���y�ګ�0,}y/Ffʦ>`�ݬej2@��k%L*�m��X9+�	�إlXѿuF*=���s��\���y�W(�1G�c��-2��_�٪�l��	ǭ��0�_�iJt�H�k��x �Y�Dl���E�	?%oҾ�׷Z�1�T��;j����'Â�z�D3���1Z�Ky�,U7R�υ�?l�}�}}�n���ٻJ_�#�wA$A���6p�P/��H�pg�OuL�-��)tt�ڤc��G�ք�i:���1�#g�RYȨa�.vsz��S�?%vJ�ѹ(WY���R��%�Yo��JcA��ڞ�-����@D�H�ϩ��]=�5�OD�f��A[/���<�����.��ʛ25W��;Z�"6�
���<��x<��H�^��C�_f<K���vMY��C���P��A��ڑ_�:G�J���R(m�2���J�%�|!�*4��W2�FI��`g[V\4֡3��F[�C��?�dU۰)�o���uB+U3 �P�ر716��p/Dדb�����/�ʳVt?��r��t��\���.�,�z�>[��c��Ǵ�]ޗ�a���Mʈ`ۏ���mޮX�!�\&(�96y�Z���2���6m���%s��]�ۅ"!�5�`px��F �`�2TYff�:�K��:*�Z��8�98��ZTm����R�˴ܿ�Z��ѣbM�Ԟ��
�Y����?DZ���������b�$iB�V�
0\�͈އ�0�>��E�d�d��� 6m_r(��Vt+��}qe�K8����p茊��1�D\^�U�|^�R���&f�$� �ԉo��a�:8w���O��16�-�XՐK����YKR��i�۴��6/6c��hQ^�! ^���o�t�^r�����O�X�E-��?�E]FY�v[��?1�a����ѓ�F��$UR�O�1x[�HKXEO�~�ޤ�U*�Z	��+r�u��9���D�|ϳ��o���,�F?��X��ۉ�/��G���i,����?�B�Q��t�U��^�\H�=O�VJÿ[���@�����TP:�Й��h96�F��=`SR@<��"�"CC��e�@����#剳=��M�.Y�],{��p��֮/�#m�F<��>�2��nZq#D\Q�Y��w�X��v�*�CE�GtB2��5�6�Z`{K����QAl}Tʩf�'�E#Z%@s��|<�z!�j��K�����e��kC�N���'�N�-#�5��s�$BB��%N-/Q����w����#m�f�7g�;`&��om�����I:s��H2Hs��q*����G�g���n�h����/��o�ޚw�����2%�,��1�U�嚸�MJ�e��§ds�y1�gci�ٚ�����.�%�<��v��?O�R=����b�n%�tO5�i�b���L>xؓ4rK�5X��.<�����99��C��5t��M �RI!\�Y�%�ةe���Z��f� ���e�����|n���3����%.aPm�hq�>�ɴ�����0�#��β�G��nr>��D ��}�#�(K"�9'!1��Q�U�����mm��'[�����D���gX���� ��| u_�o5�F0���\ad�:��}C/�[t�^�a�R=L4`��ڔxu�mUl쐻��A�M�(!JƫN[?v�FNPJB8/Z��B�U�����5�Ln}�N��q�{ �壋�ng�Na�`k�ҍ�J�#H��w�r�8�xP��h��\�E8C�"��b	,���SjMt�E��I���6�LL�"U<��F/[M�q ���}�AZ�4Y�9�2�K7v��
�i!ډq�:e�dꚩ�j���5���� ?�<ו|?z�����]�q^����� ���}���j���d����3���39m3��ؘ���Va�dk.�̐>ݍ�+jC5f�*=G�q�Y����w�=�h쉊���F�8�Sm����Su���9���@>I;N�a)"UT�mc��A�Q� M�͍�dd��)���4qkj~d9r�ߋ�ϹF���C�ķ��X#Gf����^�R���Z�ڂU�ɕn�X��y��S�� }�0�\���z����m�P��!�.l��q��;5��)�� ���6�rW���n�w,/��	If�܀�Ǿ���0�E/f(2l2��H�0F��*�W��B��Xļ`���[v�����څX��A�Y��h��r�Y�4���l��z�n��f0j�x��q�Lb)�ab�$��S��G�+p↉���)���s:�h� C\j9t��lMb�`5e�@�-(��碨�K��0�**T(s��1K�DA#NҊ�79ѓP�\W��C�C|����:E.R����V��K�I��t��J�pS�Ce��d��>��v���d��v6�u�e.��,�I�%j��OK�y9��:UR]���|K��L$�����"�p#F"Pw!��-S��5�z��32=�=2�~�%f�+\`��S�~�=�)D���V";bs#�z%�f<�R�
g��A�hӚ�(*��OC;ޑ��<Y�N�H�ƌ�lq�}(O����T{F�%l=�o��K6�Z��rC�Z���C�k2_GF�+���
���L �βm���d��F�?H�+]~�jK�<����`$�0�̥[Q;S0ܯ}�-�s|��JXS�RDщ͇�V��r~�E�Q���A���ӽM��M�3�dϻmԹf��R�ǉ>����N|�+��a�MLm�I�(���;*��5\�;&�� ��<�i�'h���o���Q�&�s}�޹�M���e�p���GT<�C~�~��m�a�N�V^���ۓ5ߋ0Lo'�z{�G �� ��L#!3�H�����<�����r�������W�'{b9�X�X����,k1 �x��9�|d-
Mn�vF�]4OQ1�@;�r�%����祆P�5�>���y�ݔ�pZ;1���'�ԉ
���V��Tqa`O�H!6�\��V��kbt�t9��>�rPfn� v�㴏��3U��0�u܍#���-����$�L���4�Ik��rQNF�m����l���P,@��s�O��Cȱ�8�@�>vfN�������,#�2��vK�?���W󬰫��H�hu���F��Y�-5N)f%���)bp��A�����P�r"�Pn�9�m&���TƉ&';����}��x�=�l
��"S=0�%��{9���&o*bX����\�m d�.P ���S@>��"���M��ld��W�r��Z�B⢴��ׂ�dy0/�!׌_E!@�Ql�ރ+��#5O���pP��P6�O�����ǜwZ�-��ܝƌ��vK#DO���>Fl���x�"��h�y���ԋE?7� S����A�GL�&�vt�� e�b@��N�9���JVƙ�����iY}ֱ\���4�:�<�ߢj�I�lr�f*��PL��ˇh���S[3��*�%�~� E��@ug<yC�֌m�s>p�U8�T2
���c3�I*e2 �&��D\�=b�Z����fD�Ȃ��F躬I�'��3I2����F�5U�8PeB�sۚ�c����u�N"R�E(�T�T|)�^�M'޲�����;e��3�N0�R�O��kCH��U��-c�Z��:#7����i�؀�Y�*1U�̻��HՇ0P�6��A}8+0L���,:d8T���l;epW�p��d�%(� s�������J�;��ȃ�� ��l�>�96��1pZ�jp�AGő��$~ �a!�o,TJ�wGz�d��-q�-K���U�M�K���1r0yJ�6Y#Dn����
A޴�ۆCX�}E�> >�^�QV3�jK�/��
'פX�䚆`���[�*�9g��g�4ۚ�XB    �xW���\�-[�#��V4�>�ל��0 ���B0�v'�CM2��a���<u$Qha���<�+�u�̙����Bn̰�fG���v���|�ߐj8,2.ɸ�p21��<�`3Q,��5�,ڎS���0�֪�1���V����V�rs��ﬃ��c���)��������6p;d��%`/��?�G�4�|��C�Gw�F��Vۥ�ah!��j"�$ڶH��M:�XD$la^Z4�rK����rIÅ?{�fK��D&���*�C�9�����%����k�H�;sYV��Yb�&��+Bb4'�	��ѧ��"����iֽ`�iC��4�0�>:~0;}�����['�u�����S_�Y&���h����4DPoM�u�u٢׉�.���������Hy�b�o�%�mD&^��_Qϯ4X#���p�K�5e��5q��*�ǟ~J戌�mO<�����{�
:�ڒ���,30YZv��(c��U�X�xS�`��)j��b0&��'H,�vІ�,�I,S�(2�򊣶,��=�� 7-���\��?'2�V�p�
�W��F�]�f4����x�V�R�NIss	�;�,E&�߭(�� 5R�rj���B�y7iM�Rm�V��qZ��,#[�b��J��&��l�z(
�G�m7k���x�]��kȐ��j��C��>��d�\�ZYĢ4�B�.���E�H"�g��~n�x�֟�u�eiJ��(�[[��s� ��Tb����G�vE��~�!T��I��DM��!��6�Z�{�c�g��Q�������!s��q�$�洴��A�x�ƙc���'����ҟ��ü*�}HlA� E�����@��Q�}��(~�����Ȝ���ziB���{)��)Q�����KG�
q9P��[��W�&��]�[�p�������Ƈ�]�U��d�H���($\;�[�n�,�;��۝V<2��U�J���am�Va-,���Ѝ�by�k�!sШ��kV�d��)-Ea��	��o�P���$F����)-bl򞋯!��� Y^|R4��y�f"�����i@[Mh�F�O�|�&�G��p-�4l��r�Y��KH	P���`�$�~m!� �7)�S��W_5��ahoL��,�ת^��m��"�QB!~=ߡ���$F���Ԣ��
40�
5�|���F��!+t_�#�V��������j��.����q̢�HN����Q�ߗ)�Y����B���c�)Yj̖��,YB��4Ǖ24�|���UBz-8��EQ��΄�� ����2���#��7�1.=/�A{���M:PdB��h��;��.�F��(�{�� f�E��3]�xc��k��A?�\y�]5��7�u�T��֤,N�+�����%*��=b��т��̢%��)�߰l�G�c-筻:r�MJ=oQ�a6i:�&u�!��LRC9*L�)eѼ�w�eYB2W4�VP��cM�Q�}��C�X�Qy����"G�L,h�؃��&$z�A�}�aBY�z ���凌U����2�C9���<	WcÂ+`�}ѡ�'=F�͋�#D���.S�զp���Ȃi��9c�	[��.4�W�������p�Q1��Be�Ń�VK����1����7RI��Lۂ��R��z{��0�b�������^��	�k�@s)�H�c��Z@2��X�+����ة��azV(�c7-�z��m�^�(�BJ����aWi�&��K��e�V�1��ϕ����$�]���D��E�V����+�˵V��b�[��@�;�q�\�N�!a�~]��#�����N�'�Q�k�v��D��m��`��ߢa`�F(�	.�L��>�VA�TQz��N�e��g�o���c���u�D,��Q+C	��������r�omh-��e��a�WP�AE��V�径B�>k�S��*\(1Q�+^
��G�p��������Η�;&~Z=t���{�'�i?� 1�gwM5���M+g��_!U��B�]ύRP��:��%�5|�e�dMh�=�}��P��[8)�B�u�,�9�*��b�WZɁn�?6lSI6�s7b9�h��e�w��k���>�ո���O��' q��"��en�n0Jd���i�"\a��WX�����x�	r�ĸf����HaZ�n1����i��z8��&����=W&��Ю�󺛧�t7�H�T.�a�������\<�$d��d'�v�$����#���X03�Fkȑͥ�����b}}J�·��;����eS�jB�zqòE�e��m���=˝��Z������;y�)���᧾��  ��.�J��[�(�F���� ��8	c��DpA�����3F)���%���?7a�wcY11\����@�4��f��@E<��+T�(DߪXm��(,��8������]6.6��D��Dp"�&�K�?�e��R2�<>%�NY��.����e�k�;-*��>�F+5
�z���	!Ìu1���=J���%ƾ��H5�瑃(�����xeU.f���:GEqjx\-x�ؖ2m���� �Rz�k�9L<t�`�R��A�����ih"c��h��j����hTȕDX�����<��jb�Iq��-�9��/�&"����ɒq���Z2$^ Q�h�q���oH�2��Z�@�
r��Þش�j���� щ�N	,�`L([P��.	�.BQ��0���2dfrB���]EѬB�(1eRa��d`���g�h��L�|ːu���MPCd�<��Q'�<�8�I��ȀS�Z��e�AO��84��M��i}#�,��wV���$IB��b��$�/WP�=�u����[S���ͭU!@��f��fLȗ��'���f�?��D�f�`n��zeԲP1�3����[�OW�!�(!�IC	��8Y��51Z��� ��!�$S�	9����,��:&�����>����8���x�"��q����#���^�J�a1�DƱ?�>��/7�e�e`�%�����#���#А�E��� �,Q���d"c4x?m�P��1j�`_��|A#T�\�i4vhA$b�C+�\*�{C����F9ݕ�[�`E��=��R��-*��fS�Z��X@%�g��vב2�=�0�'���_']zM]y�rI6gvo ��ȗX~1�G �iĥ������Wm�Ďa��Dǡ���k}�[F��"	|�����XAMM�[6����>]�&|]�q�z/�H�a;3�FZ�$	�,\�Y���d��CN�2���	LIڟf�n���с�4d}Ʋ��t���0�����?�0U�R�ZIZ�(�4��4�����b�s��)I�{Nfp��K���}��<�֣�n���?|S|tʗ_��f%�r�����5}�
mB��4��2�I�-G�:&��q���5`��n�Ա����Y��Ug�?�h��i�u���U�x,��n�չ.w�]D�Z�鑹�z6�����d�ζ�oe�F{��U�e�rݴ��}�|��i��Ъ��A4xA�dh���a39�����ձ�2~9�8'`}��9%+����)��pD�F�ۡ������>0z�c
�E��]��r��n7C��9Zt�-��@f���(U�s=]X��ԭ���Z��K�|Gd塿$�y���aK��ڥk�4�F�����y~�Y	�M��ʛbb�:��7�=@��]G0)㑔t��zaA�L�h=M�yx�� 0f<B����	��)U�F�-:ː�9e�܇���N�,�k�8U�Ų��O\��H��B��3���ݜ�g01L�̬{��o�"��0��z����~/���6�5��s��=��s��rm�w�=��ӧ����5�R9@5X?2�`#	48&gL̝Ȉ9�q�tY� _L�t�%�w]��������}B�'"K�����i�+1zS=󷩌�H$L�
�I�6���j�{��)�|�u9k� �
}LaC���� `  �.�@��Th�AE��m������5@�H~H�J�%@0��h��I�F!=�*6?G��j�=|ɓ��mh��Ǥ�	���^#7蛁��],�-_S�NW�������	��l=��Yr�]�����&a_&����r#�8�c�B����lsUF�P�F��Z��$�3�4Hr�J�n%��
5{Du5�P��7���ORi0��ۍ�A��q1�I�Y���'(>�j �erȰ2d�GO�������9��C��^�d�V���>u`�OWl
}�&pixPp����s��r^;�1(Nu��A	�fd�l}/�ݕ�z��`����m�D�W�5{y���n��V:�D�T:%����w����18T��j~�[��L���Z�}*�C�*��|�b0�\D!.&f�лo>P'^��uGLM���gw����p�R߸�f�0Mp�N�)�م�w ��f	�*�Ls�ԜP��f4mjم��^_2��a���e	[�6���&"��@�S�P�
��#ۈ�		{��^�-Tk�����������iw��C}���xvz�����:�_�]�c}|�Mn\���;���ܻ����<��Xف�q��_�x�W�      +   G   x����PB��P��}�����V'!�.WdWג�<`ʳ�	����À��Vn���Q��KƜ}����;      #   ,  x�e��v�@�5<��i���Yy�+�%��pA�)���g�'��U��S�s�4ʞ�4Nz>�;�\;]���9�ǭ>	G�d}���'����fj`��=����5���h'�sb��:�)��`@Y�D�!su\��V��E���S':>
��w�;v��K�������E��.��)�h1R����W4���b��}�] �b
�H��D)�y�^ v�ڽe���-��`�Ѡ��d��6]�ڮ1d��|?
w�������>��vв�[Ű��� �b$s/��"Ȝ��7�8�MP��6�(�X�ԍ۳6:���s=<_�z��i��#�i.���٫k8u��`�P��ĉ<�����*(�ǝ�;�Eۥ�e�(>2�9@C�n�S'�r�Jө&�e�4��ͽ��L���""��I�᥇���K]�Y�:p�j����zW�.�h^t�����3���k����@E� QD��I<}��=�q< d^W�7��_Vȓ��d��Ь������bm�ӝ���:��2@f�������V ��     