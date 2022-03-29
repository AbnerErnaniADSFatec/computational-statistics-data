PGDMP     !                    z            bdc_dce %   10.19 (Ubuntu 10.19-0ubuntu0.18.04.1) %   10.19 (Ubuntu 10.19-0ubuntu0.18.04.1) (    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    57824    bdc_dce    DATABASE     y   CREATE DATABASE bdc_dce WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE bdc_dce;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    13041    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            g           1247    57875    layertypeenum    TYPE     p   CREATE TYPE public.layertypeenum AS ENUM (
    'BASE',
    'GRID',
    'LIMIT',
    'MOSAIC',
    'THEMATIC'
);
     DROP TYPE public.layertypeenum;
       public       gabriel    false    3            �            1259    57825    alembic_version    TABLE     X   CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         gabriel    false    3            �            1259    57832    context    TABLE     �   CREATE TABLE public.context (
    context_id integer NOT NULL,
    context_item json NOT NULL,
    date timestamp without time zone NOT NULL,
    user_id integer
);
    DROP TABLE public.context;
       public         gabriel    false    3            �            1259    57830    context_context_id_seq    SEQUENCE     �   CREATE SEQUENCE public.context_context_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.context_context_id_seq;
       public       gabriel    false    3    198            �           0    0    context_context_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.context_context_id_seq OWNED BY public.context.context_id;
            public       gabriel    false    197            �            1259    57843    grid    TABLE     -  CREATE TABLE public.grid (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    title character varying(100) NOT NULL,
    service_url character varying(255) NOT NULL,
    workspace character varying(100) NOT NULL,
    style_wms character varying(100) NOT NULL,
    metadata json
);
    DROP TABLE public.grid;
       public         gabriel    false    3            �            1259    57841    grid_id_seq    SEQUENCE     �   CREATE SEQUENCE public.grid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.grid_id_seq;
       public       gabriel    false    200    3            �           0    0    grid_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.grid_id_seq OWNED BY public.grid.id;
            public       gabriel    false    199            �            1259    57854    layer    TABLE     t  CREATE TABLE public.layer (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    title character varying(100) NOT NULL,
    service_url character varying(255) NOT NULL,
    workspace character varying(100),
    style_wms character varying(100),
    additional_attrs json,
    metadata json,
    user_id integer,
    type public.layertypeenum NOT NULL
);
    DROP TABLE public.layer;
       public         gabriel    false    615    3            �            1259    57852    layer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.layer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.layer_id_seq;
       public       gabriel    false    202    3            �           0    0    layer_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.layer_id_seq OWNED BY public.layer.id;
            public       gabriel    false    201            �            1259    57865    style    TABLE     I  CREATE TABLE public.style (
    style_id integer NOT NULL,
    title character varying(100) NOT NULL,
    red json,
    green json,
    blue json,
    gamma double precision NOT NULL,
    saturation double precision NOT NULL,
    sigmoidal double precision NOT NULL,
    opacity double precision NOT NULL,
    user_id integer
);
    DROP TABLE public.style;
       public         gabriel    false    3            �            1259    57863    style_style_id_seq    SEQUENCE     �   CREATE SEQUENCE public.style_style_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.style_style_id_seq;
       public       gabriel    false    204    3            �           0    0    style_style_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.style_style_id_seq OWNED BY public.style.style_id;
            public       gabriel    false    203            �
           2604    57835    context context_id    DEFAULT     x   ALTER TABLE ONLY public.context ALTER COLUMN context_id SET DEFAULT nextval('public.context_context_id_seq'::regclass);
 A   ALTER TABLE public.context ALTER COLUMN context_id DROP DEFAULT;
       public       gabriel    false    198    197    198                        2604    57846    grid id    DEFAULT     b   ALTER TABLE ONLY public.grid ALTER COLUMN id SET DEFAULT nextval('public.grid_id_seq'::regclass);
 6   ALTER TABLE public.grid ALTER COLUMN id DROP DEFAULT;
       public       gabriel    false    200    199    200                       2604    57857    layer id    DEFAULT     d   ALTER TABLE ONLY public.layer ALTER COLUMN id SET DEFAULT nextval('public.layer_id_seq'::regclass);
 7   ALTER TABLE public.layer ALTER COLUMN id DROP DEFAULT;
       public       gabriel    false    201    202    202                       2604    57868    style style_id    DEFAULT     p   ALTER TABLE ONLY public.style ALTER COLUMN style_id SET DEFAULT nextval('public.style_style_id_seq'::regclass);
 =   ALTER TABLE public.style ALTER COLUMN style_id DROP DEFAULT;
       public       gabriel    false    203    204    204            �          0    57825    alembic_version 
   TABLE DATA               6   COPY public.alembic_version (version_num) FROM stdin;
    public       gabriel    false    196   *       �          0    57832    context 
   TABLE DATA               J   COPY public.context (context_id, context_item, date, user_id) FROM stdin;
    public       gabriel    false    198   >*       �          0    57843    grid 
   TABLE DATA               \   COPY public.grid (id, name, title, service_url, workspace, style_wms, metadata) FROM stdin;
    public       gabriel    false    200   [*       �          0    57854    layer 
   TABLE DATA               ~   COPY public.layer (id, name, title, service_url, workspace, style_wms, additional_attrs, metadata, user_id, type) FROM stdin;
    public       gabriel    false    202   x*       �          0    57865    style 
   TABLE DATA               r   COPY public.style (style_id, title, red, green, blue, gamma, saturation, sigmoidal, opacity, user_id) FROM stdin;
    public       gabriel    false    204   �9       �           0    0    context_context_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.context_context_id_seq', 1, false);
            public       gabriel    false    197            �           0    0    grid_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.grid_id_seq', 1, false);
            public       gabriel    false    199            �           0    0    layer_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.layer_id_seq', 1, false);
            public       gabriel    false    201            �           0    0    style_style_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.style_style_id_seq', 1, false);
            public       gabriel    false    203                       2606    57829 #   alembic_version alembic_version_pkc 
   CONSTRAINT     j   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
 M   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
       public         gabriel    false    196                       2606    57840    context context_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.context
    ADD CONSTRAINT context_pkey PRIMARY KEY (context_id);
 >   ALTER TABLE ONLY public.context DROP CONSTRAINT context_pkey;
       public         gabriel    false    198                       2606    57851    grid grid_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.grid
    ADD CONSTRAINT grid_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.grid DROP CONSTRAINT grid_pkey;
       public         gabriel    false    200            
           2606    57862    layer layer_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.layer
    ADD CONSTRAINT layer_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.layer DROP CONSTRAINT layer_pkey;
       public         gabriel    false    202                       2606    57873    style style_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.style
    ADD CONSTRAINT style_pkey PRIMARY KEY (style_id);
 :   ALTER TABLE ONLY public.style DROP CONSTRAINT style_pkey;
       public         gabriel    false    204            �      x�KK�42I5�HK6K����� /�I      �      x������ � �      �      x������ � �      �   J  x��]�n���V�b�EH��ز��(G�� q
�X@�cyvI�C*�ھB� ��b�{����r�&}��33�H��%���`.,���̙�s���p��8��Fb����h̅�_��4��8|�n�,��8��{\n�!��Aȶ�Q{dєE�0.�-�l��ecvXQ��΄�h�<%['�$���8��\�cGԉU�C2� �	��+$qD¿��G7�|{q!�ģ�7����GF"FL��G�[MB�M�s�-����ɰ}xp�� /m9�q�%��Ҙ���N�>s�x�( �x��y��oL��sl:i����9~1|��x��I�$r؈g�]f���7mM�,��SOL�%��s���9�Q�)v�R��Fu�pIu�D&����`_5N������	��XБ _��zLt^�jz�Cɩ$.#S6a1MH�)H�,�6�nD]�P�xTJ�%��T��PW�p�����7ɷ	#������ p8�"%~����$� ��v3��� 2>"���2�n���ݩ��|D�0}s��/�������O@M���e�Ri�E`����)]"�(��o��8�J��3�_���v�Oc��?HH��GhШ6q����Gu=�b�m<��)�>�� �s�8����4pለ�H�s���M��BH�pT'��b~�8BE.�U�)��*��5�{�91
Ce�=��rh>8��Ev�	[D&��ۂ�� �pJ�`?.|1û<K�$�F�\��L˚�z��ȭ+M��֍�J�^UȺ���z��蝝�;)FZ���i��"��wE����=Ӳ�)�/�������Cr�
�b���@�Y�,��O���������w��G?�1�*E�i�@����%��|��<ԡ�)�	���V�ަ[��P	``�b����I�z�t�v���#��zܥP�Lp���A�L�O������xT��Z��8�|���F&4��L,HqӞ���)#�3��	�ӌ�=G�݄�a�q�?�G�IΘa��Q�gc�㇞��
p�w��7� �G��.�į$P=����cS���5�_0J�,�!�p��t�1��(�I?!pq)��Ӌ)��J��@u���w��,���.�S/�P<��N� �5	t(�*K��ʵ�V�?�k�F!>5� �@#z��O��JJg� �#U�d�l�c�(���ѱЭ�yPSc�Ō`��(�ۙ����^�j)�}�����#c�`ɉ��O<#���->K��zz��#� ��D�����!����98ۃ�o�����q�ɯhV�F=�! D���S�������0�G U�}G�p>�!�0���ٝN�p�ǀ��(�Ap���zϲ3�(��}FN(x�:�ģ���J�z��_���F���  C5����\>��{�� u��3�B��Jy%�Ӫ��u}QѢ8ty(���@'�ZoAA 9�oݴ���p�M�_~J/&	U��=���E�U�=����9�BU^2�Q�q��)y����2������b>ʵZ@�Cz���A���!���`���' ����o��O�+y�Ƌ�YHkP����ϫ�p5U�m��f�ݹl�.�b-p�K[�]۝���Nk��+Z�@m�Ǿ����:��h��<���N�ġ:5q���ġ:�CYe9��P�CYuթ�Cuj�P�5�P��P�9��-q�nM��9q���P�CYe9��P�C݄Cu��P�8Tw�8Tw�8T�:N� 3wn�<	G��+q�Y!���"IH�����,��"�9��bUK�Z��}��ֺ�3a� �d\�Wm����N����,�W�ʖ��|t�2wպ����"�qI�yP�:����y4���vPR�^ﯬ�F�n��R���\�P��G"�	�'��3�O������[LY�/�|a<�Y�J���$ι��t=Ve���c�5IAe��<pز�q��WIZ/�XV������|�[&k_��JV�5��^l��<�����zgQû0�]c*#c*#e�0.����buV2�!fe`���+�����!Ɔ)Wp���cS���UI�*0A�tP��� �~��3�bv�y��Qe[�<�I�U(��$�u* ��VA��������vw{WL!;O�}��}���jW&��ד���~7H]��A��L_i�$چ�s�#'F�O/��n7��M�3����z����y��4������Zº@����z��k�� ��E�^�o���ѫ'��̫%A2E?cD
�R�^w.�X�C��R�vK_=�ʽ�X��{\�C\r�L,��a����2�紽�^��-b�zT�����z�ԭ�� �i[˛��ֶwK+�5���~N+�v�ܮ��s�bnW���MV�w�Z1߭a�|w�V�w7o�|��7m"F�~�==C�J��wcNu]-���Y�e9��X�cY�e9�M8V�.�ի�c�֌c�6�c�-b?�*�կ�c�?C�շ�r,˱,ǲ�r�e9V�d��"Y�HV�HV�HV���d������̶n:ѹ^��WV+�:$�zRѦl{�g�����	�+��0:OPSԄcrw�.42�r
ĩ)YA��RpN�H�r��D�T%�@��a��ҍ�\�1L'(�5қ
gQU��\_ʂ�µ���a��+(+b��^��0R!>/���(�"�
�,{l�$1�C�������!�Yp~�Smw�s*�)J�F/�)���y�R!Q��0��tF�;Ef�g��rکS������4�&����e�b|p5)�������z 
6�©�A_(�:����{=��|�U��������72$���r:|�-28�!��ѫA}*#�̈́�a�XU�͋��p~@��Ⱦ�a��벡Æ:l�(���q|���P����
u6/h���ܼ$����a�05وa#��6b�u u��Vs��2�)fT�yA�I%�Ҙ�1>��h�!���{u|�1d�bJl(��Ć��n���u��# �[E�kE�O`�B���/ݝJ�?A?j��R0�5��Jl�!ĆB
 {28<�U�X �~��%e6/Ht�7�P��}��yG^�6\�pa�E	`�NG�׷��d�Wи���ōn#vp�����gIU-<�(*�d�����A�JAUQbvؘݥ�)E�Y��d����R
�1�Q�}�w��_�0	�9la�c��Dj�L�<]�K/h��e ��y�z�M 8���+�~�eb�V 蝂L~�,�5��<JU?K@єL@m�Q�,V�pu���f��@���o��H��I������V	Uf-���ń��^	���Kp� d���0	6g�i���3���g�G�#�qK5�eu���x��,�?'��u�;G�G	*��b9�Q���H����Rs��)8�c�	�2�bLO�?p�TL���S�!Xs�s!K�$  /�FZ�#�#�I���r�ۆqA�ڃ�ֆ�� ��A,�YJ~��51���6gn���j�զ2�0{���}y���p@�_�K���[��@�g�I�>@��e�[�*ft�x���1���;�P^gq���,u{�ЉY� �99<nRґ 9�Q�	��m��~(�� �
��g�y��ޱÓ6��]{ʗK�����q�����)� �T��{6�pD?�:�T�u] ��bEE=�h���W�|�¼�y��7��$���_=�X[���0�٩���o�Z��0oa���&�|�c.���߿��ئ�����n%�w-�[��0oa~3a�����ww9���W���{�+��w�y��-�o(̯�l~~_�k�m���ü��V)Eǂ�y��7
�y2_�� ���_���K��u��+,��W�<�?��D      �      x������ � �     