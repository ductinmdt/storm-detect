PGDMP  /                    {            storm-detect    16.1    16.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    50248    storm-detect    DATABASE     �   CREATE DATABASE "storm-detect" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "storm-detect";
                postgres    false            �            1259    50259    comment    TABLE     �   CREATE TABLE public.comment (
    id integer NOT NULL,
    video character varying NOT NULL,
    image character varying NOT NULL,
    "userId" integer NOT NULL,
    "stormId" integer NOT NULL
);
    DROP TABLE public.comment;
       public         heap    postgres    false            �            1259    50258    comment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.comment_id_seq;
       public          postgres    false    218            �           0    0    comment_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;
          public          postgres    false    217            �            1259    50268    storms    TABLE     �   CREATE TABLE public.storms (
    id integer NOT NULL,
    "cityName" character varying NOT NULL,
    "affectedAreas" integer NOT NULL,
    "detectedTime" timestamp without time zone NOT NULL,
    "userId" integer
);
    DROP TABLE public.storms;
       public         heap    postgres    false            �            1259    50267    storms_id_seq    SEQUENCE     �   CREATE SEQUENCE public.storms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.storms_id_seq;
       public          postgres    false    220            �           0    0    storms_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.storms_id_seq OWNED BY public.storms.id;
          public          postgres    false    219            �            1259    50250    user    TABLE       CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL,
    firstname character varying,
    lastname character varying,
    email character varying,
    phone character varying
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    50249    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false    216            �           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public          postgres    false    215            %           2604    50262 
   comment id    DEFAULT     h   ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);
 9   ALTER TABLE public.comment ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            &           2604    50271 	   storms id    DEFAULT     f   ALTER TABLE ONLY public.storms ALTER COLUMN id SET DEFAULT nextval('public.storms_id_seq'::regclass);
 8   ALTER TABLE public.storms ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            $           2604    50253    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �          0    50259    comment 
   TABLE DATA           H   COPY public.comment (id, video, image, "userId", "stormId") FROM stdin;
    public          postgres    false    218   �       �          0    50268    storms 
   TABLE DATA           [   COPY public.storms (id, "cityName", "affectedAreas", "detectedTime", "userId") FROM stdin;
    public          postgres    false    220   �       �          0    50250    user 
   TABLE DATA           [   COPY public."user" (id, username, password, firstname, lastname, email, phone) FROM stdin;
    public          postgres    false    216   �       �           0    0    comment_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.comment_id_seq', 1, false);
          public          postgres    false    217            �           0    0    storms_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.storms_id_seq', 1, false);
          public          postgres    false    219            �           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 1, false);
          public          postgres    false    215            *           2606    50266 &   comment PK_0b0e4bbc8415ec426f87f3a88e2 
   CONSTRAINT     f   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT "PK_0b0e4bbc8415ec426f87f3a88e2" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.comment DROP CONSTRAINT "PK_0b0e4bbc8415ec426f87f3a88e2";
       public            postgres    false    218            (           2606    50257 #   user PK_cace4a159ff9f2512dd42373760 
   CONSTRAINT     e   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public."user" DROP CONSTRAINT "PK_cace4a159ff9f2512dd42373760";
       public            postgres    false    216            ,           2606    50275 %   storms PK_d46b08f1083d5eadb79bdddd502 
   CONSTRAINT     e   ALTER TABLE ONLY public.storms
    ADD CONSTRAINT "PK_d46b08f1083d5eadb79bdddd502" PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public.storms DROP CONSTRAINT "PK_d46b08f1083d5eadb79bdddd502";
       public            postgres    false    220            -           2606    50281 &   comment FK_3aec50f7a21da4cd25c7f352580    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT "FK_3aec50f7a21da4cd25c7f352580" FOREIGN KEY ("stormId") REFERENCES public.storms(id);
 R   ALTER TABLE ONLY public.comment DROP CONSTRAINT "FK_3aec50f7a21da4cd25c7f352580";
       public          postgres    false    4652    218    220            /           2606    50286 %   storms FK_b7f845a9f7b67c06b5cd3fafab5    FK CONSTRAINT     �   ALTER TABLE ONLY public.storms
    ADD CONSTRAINT "FK_b7f845a9f7b67c06b5cd3fafab5" FOREIGN KEY ("userId") REFERENCES public."user"(id);
 Q   ALTER TABLE ONLY public.storms DROP CONSTRAINT "FK_b7f845a9f7b67c06b5cd3fafab5";
       public          postgres    false    4648    216    220            .           2606    50276 &   comment FK_c0354a9a009d3bb45a08655ce3b    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT "FK_c0354a9a009d3bb45a08655ce3b" FOREIGN KEY ("userId") REFERENCES public."user"(id);
 R   ALTER TABLE ONLY public.comment DROP CONSTRAINT "FK_c0354a9a009d3bb45a08655ce3b";
       public          postgres    false    216    4648    218            �      x������ � �      �      x������ � �      �      x������ � �     