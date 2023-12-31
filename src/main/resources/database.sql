PGDMP                         {           skypay    15.3    15.3 "    %           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            &           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            '           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            (           1262    16398    skypay    DATABASE     �   CREATE DATABASE skypay WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE skypay;
                postgres    false            �            1259    16400    account    TABLE       CREATE TABLE public.account (
    id bigint NOT NULL,
    account_number bigint NOT NULL,
    agency_address character varying(255),
    creation_date timestamp(6) without time zone,
    is_active boolean NOT NULL,
    rib bigint,
    physicalcard_id bigint
);
    DROP TABLE public.account;
       public         heap    postgres    false            �            1259    16399    account_id_seq    SEQUENCE     w   CREATE SEQUENCE public.account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.account_id_seq;
       public          postgres    false    215            )           0    0    account_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.account_id_seq OWNED BY public.account.id;
          public          postgres    false    214            �            1259    16406    account_virtual_cards    TABLE     t   CREATE TABLE public.account_virtual_cards (
    account_id bigint NOT NULL,
    virtual_cards_id bigint NOT NULL
);
 )   DROP TABLE public.account_virtual_cards;
       public         heap    postgres    false            �            1259    16409    client    TABLE     B  CREATE TABLE public.client (
    uuid uuid NOT NULL,
    birth_address character varying(255),
    birth_date timestamp(6) without time zone,
    first_name character varying(255),
    last_name character varying(255),
    phone_number character varying(255),
    account_id bigint,
    password character varying(255)
);
    DROP TABLE public.client;
       public         heap    postgres    false            �            1259    16416    physical_card    TABLE       CREATE TABLE public.physical_card (
    id bigint NOT NULL,
    creation_date timestamp(6) without time zone,
    experation_date timestamp(6) without time zone,
    card_number character varying(255),
    cvc character varying(255),
    is_enabled boolean NOT NULL
);
 !   DROP TABLE public.physical_card;
       public         heap    postgres    false            �            1259    16423    virtual_card    TABLE     #  CREATE TABLE public.virtual_card (
    id bigint NOT NULL,
    creation_date timestamp(6) without time zone,
    experation_date timestamp(6) without time zone,
    card_number character varying(255),
    cvc character varying(255),
    is_enabled boolean NOT NULL,
    account_id bigint
);
     DROP TABLE public.virtual_card;
       public         heap    postgres    false            �            1259    16465    virtual_card_seq    SEQUENCE     z   CREATE SEQUENCE public.virtual_card_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.virtual_card_seq;
       public          postgres    false            v           2604    16403 
   account id    DEFAULT     h   ALTER TABLE ONLY public.account ALTER COLUMN id SET DEFAULT nextval('public.account_id_seq'::regclass);
 9   ALTER TABLE public.account ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215                      0    16400    account 
   TABLE DATA           u   COPY public.account (id, account_number, agency_address, creation_date, is_active, rib, physicalcard_id) FROM stdin;
    public          postgres    false    215   �*                 0    16406    account_virtual_cards 
   TABLE DATA           M   COPY public.account_virtual_cards (account_id, virtual_cards_id) FROM stdin;
    public          postgres    false    216   +                 0    16409    client 
   TABLE DATA           |   COPY public.client (uuid, birth_address, birth_date, first_name, last_name, phone_number, account_id, password) FROM stdin;
    public          postgres    false    217   %+                  0    16416    physical_card 
   TABLE DATA           i   COPY public.physical_card (id, creation_date, experation_date, card_number, cvc, is_enabled) FROM stdin;
    public          postgres    false    218   �+       !          0    16423    virtual_card 
   TABLE DATA           t   COPY public.virtual_card (id, creation_date, experation_date, card_number, cvc, is_enabled, account_id) FROM stdin;
    public          postgres    false    219   �+       *           0    0    account_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.account_id_seq', 1, false);
          public          postgres    false    214            +           0    0    virtual_card_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.virtual_card_seq', 1, true);
          public          postgres    false    220            x           2606    16405    account account_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
       public            postgres    false    215            ~           2606    16415    client client_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (uuid);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            postgres    false    217            �           2606    16422     physical_card physical_card_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.physical_card
    ADD CONSTRAINT physical_card_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.physical_card DROP CONSTRAINT physical_card_pkey;
       public            postgres    false    218            �           2606    16439 (   virtual_card uk3kji8sh3kbr02e7r00i4fhwek 
   CONSTRAINT     j   ALTER TABLE ONLY public.virtual_card
    ADD CONSTRAINT uk3kji8sh3kbr02e7r00i4fhwek UNIQUE (card_number);
 R   ALTER TABLE ONLY public.virtual_card DROP CONSTRAINT uk3kji8sh3kbr02e7r00i4fhwek;
       public            postgres    false    219            |           2606    16433 2   account_virtual_cards uk_2bywujfx305mjwy2b5kgrvm3f 
   CONSTRAINT     y   ALTER TABLE ONLY public.account_virtual_cards
    ADD CONSTRAINT uk_2bywujfx305mjwy2b5kgrvm3f UNIQUE (virtual_cards_id);
 \   ALTER TABLE ONLY public.account_virtual_cards DROP CONSTRAINT uk_2bywujfx305mjwy2b5kgrvm3f;
       public            postgres    false    216            z           2606    16431 $   account uk_a82mvlbjhxo467ge9j3od6qqc 
   CONSTRAINT     ^   ALTER TABLE ONLY public.account
    ADD CONSTRAINT uk_a82mvlbjhxo467ge9j3od6qqc UNIQUE (rib);
 N   ALTER TABLE ONLY public.account DROP CONSTRAINT uk_a82mvlbjhxo467ge9j3od6qqc;
       public            postgres    false    215            �           2606    16435 "   client uk_jgbii7eaw72fc9llajcdeyjb 
   CONSTRAINT     e   ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_jgbii7eaw72fc9llajcdeyjb UNIQUE (phone_number);
 L   ALTER TABLE ONLY public.client DROP CONSTRAINT uk_jgbii7eaw72fc9llajcdeyjb;
       public            postgres    false    217            �           2606    16437 )   physical_card ukfq4gf6ui7raffcg6nr5tj7pvn 
   CONSTRAINT     k   ALTER TABLE ONLY public.physical_card
    ADD CONSTRAINT ukfq4gf6ui7raffcg6nr5tj7pvn UNIQUE (card_number);
 S   ALTER TABLE ONLY public.physical_card DROP CONSTRAINT ukfq4gf6ui7raffcg6nr5tj7pvn;
       public            postgres    false    218            �           2606    16429    virtual_card virtual_card_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.virtual_card
    ADD CONSTRAINT virtual_card_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.virtual_card DROP CONSTRAINT virtual_card_pkey;
       public            postgres    false    219            �           2606    16440 #   account fkbynj4oppvkn4vn3qg47ooqot4    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT fkbynj4oppvkn4vn3qg47ooqot4 FOREIGN KEY (physicalcard_id) REFERENCES public.physical_card(id);
 M   ALTER TABLE ONLY public.account DROP CONSTRAINT fkbynj4oppvkn4vn3qg47ooqot4;
       public          postgres    false    3202    218    215            �           2606    16455 "   client fkisxed4kdvp061a3sweh6ml6pg    FK CONSTRAINT     �   ALTER TABLE ONLY public.client
    ADD CONSTRAINT fkisxed4kdvp061a3sweh6ml6pg FOREIGN KEY (account_id) REFERENCES public.account(id);
 L   ALTER TABLE ONLY public.client DROP CONSTRAINT fkisxed4kdvp061a3sweh6ml6pg;
       public          postgres    false    217    215    3192            �           2606    16445 1   account_virtual_cards fkkcmmx31ewftshdfhmvqy7jyvf    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_virtual_cards
    ADD CONSTRAINT fkkcmmx31ewftshdfhmvqy7jyvf FOREIGN KEY (virtual_cards_id) REFERENCES public.virtual_card(id);
 [   ALTER TABLE ONLY public.account_virtual_cards DROP CONSTRAINT fkkcmmx31ewftshdfhmvqy7jyvf;
       public          postgres    false    3208    216    219            �           2606    16460 (   virtual_card fkpbv1uqfeh65gx92y4l70qec5t    FK CONSTRAINT     �   ALTER TABLE ONLY public.virtual_card
    ADD CONSTRAINT fkpbv1uqfeh65gx92y4l70qec5t FOREIGN KEY (account_id) REFERENCES public.account(id);
 R   ALTER TABLE ONLY public.virtual_card DROP CONSTRAINT fkpbv1uqfeh65gx92y4l70qec5t;
       public          postgres    false    215    219    3192            �           2606    16450 1   account_virtual_cards fkt73jog8mc0q6q72igolqa0vnp    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_virtual_cards
    ADD CONSTRAINT fkt73jog8mc0q6q72igolqa0vnp FOREIGN KEY (account_id) REFERENCES public.account(id);
 [   ALTER TABLE ONLY public.account_virtual_cards DROP CONSTRAINT fkt73jog8mc0q6q72igolqa0vnp;
       public          postgres    false    216    3192    215               3   x�3�4��II)�O�4200�50"+0�,�442621������� �V	g            x������ � �         �   x��K�0 �u{
lkf�ť��D#�	q�����9��//�V�Z��F�@ERDjֈ·Η3�IPL[� �@� ���6��k��5�;C�P2d��W,�*Ɇ�:��%L��~eo�Q��	�m^���ԇ�����{�w�OS��O�(�             x������ � �      !   ]   x�e̻�@��:7p��In�`�@H���� 
�qm��#'��u���g���hB���7E�����xS�nULUT�۶q���{k��?�     