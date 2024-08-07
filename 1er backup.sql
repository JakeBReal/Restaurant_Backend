PGDMP           	            |            restaurant_db    16.3    16.3 0               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    32842    restaurant_db    DATABASE     �   CREATE DATABASE restaurant_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE restaurant_db;
                postgres    false            �            1259    32858    clientes    TABLE     �   CREATE TABLE public.clientes (
    id integer NOT NULL,
    name character varying(100),
    table_number integer,
    date timestamp without time zone
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    32857    clientes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.clientes_id_seq;
       public          postgres    false    220                        0    0    clientes_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;
          public          postgres    false    219            �            1259    32865    cuentas    TABLE     �   CREATE TABLE public.cuentas (
    id integer NOT NULL,
    client_id integer,
    total numeric(10,2),
    status character varying(50)
);
    DROP TABLE public.cuentas;
       public         heap    postgres    false            �            1259    32864    cuentas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cuentas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.cuentas_id_seq;
       public          postgres    false    222            !           0    0    cuentas_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.cuentas_id_seq OWNED BY public.cuentas.id;
          public          postgres    false    221            �            1259    32851    menu    TABLE     p   CREATE TABLE public.menu (
    id integer NOT NULL,
    name character varying(100),
    price numeric(10,2)
);
    DROP TABLE public.menu;
       public         heap    postgres    false            �            1259    32850    menu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.menu_id_seq;
       public          postgres    false    218            "           0    0    menu_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.menu_id_seq OWNED BY public.menu.id;
          public          postgres    false    217            �            1259    32844    salas    TABLE     z   CREATE TABLE public.salas (
    id integer NOT NULL,
    name character varying(100),
    status character varying(50)
);
    DROP TABLE public.salas;
       public         heap    postgres    false            �            1259    32843    salas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.salas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.salas_id_seq;
       public          postgres    false    216            #           0    0    salas_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.salas_id_seq OWNED BY public.salas.id;
          public          postgres    false    215            �            1259    32872    totaldeventa    TABLE     }   CREATE TABLE public.totaldeventa (
    id integer NOT NULL,
    total numeric(10,2),
    date timestamp without time zone
);
     DROP TABLE public.totaldeventa;
       public         heap    postgres    false            �            1259    32871    totaldeventa_id_seq    SEQUENCE     �   CREATE SEQUENCE public.totaldeventa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.totaldeventa_id_seq;
       public          postgres    false    224            $           0    0    totaldeventa_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.totaldeventa_id_seq OWNED BY public.totaldeventa.id;
          public          postgres    false    223            �            1259    32879    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre_completo character varying(50) NOT NULL,
    correo character varying(50) NOT NULL,
    usuario character varying(50) NOT NULL,
    contrasena character varying(50) NOT NULL
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            �            1259    32878    usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public          postgres    false    226            %           0    0    usuarios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;
          public          postgres    false    225            k           2604    32861    clientes id    DEFAULT     j   ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);
 :   ALTER TABLE public.clientes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            l           2604    32868 
   cuentas id    DEFAULT     h   ALTER TABLE ONLY public.cuentas ALTER COLUMN id SET DEFAULT nextval('public.cuentas_id_seq'::regclass);
 9   ALTER TABLE public.cuentas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            j           2604    32854    menu id    DEFAULT     b   ALTER TABLE ONLY public.menu ALTER COLUMN id SET DEFAULT nextval('public.menu_id_seq'::regclass);
 6   ALTER TABLE public.menu ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            i           2604    32847    salas id    DEFAULT     d   ALTER TABLE ONLY public.salas ALTER COLUMN id SET DEFAULT nextval('public.salas_id_seq'::regclass);
 7   ALTER TABLE public.salas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            m           2604    32875    totaldeventa id    DEFAULT     r   ALTER TABLE ONLY public.totaldeventa ALTER COLUMN id SET DEFAULT nextval('public.totaldeventa_id_seq'::regclass);
 >   ALTER TABLE public.totaldeventa ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            n           2604    32882    usuarios id    DEFAULT     j   ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
 :   ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226                      0    32858    clientes 
   TABLE DATA           @   COPY public.clientes (id, name, table_number, date) FROM stdin;
    public          postgres    false    220   �1                 0    32865    cuentas 
   TABLE DATA           ?   COPY public.cuentas (id, client_id, total, status) FROM stdin;
    public          postgres    false    222   �1                 0    32851    menu 
   TABLE DATA           /   COPY public.menu (id, name, price) FROM stdin;
    public          postgres    false    218   �1                 0    32844    salas 
   TABLE DATA           1   COPY public.salas (id, name, status) FROM stdin;
    public          postgres    false    216   2                 0    32872    totaldeventa 
   TABLE DATA           7   COPY public.totaldeventa (id, total, date) FROM stdin;
    public          postgres    false    224   ,2                 0    32879    usuarios 
   TABLE DATA           T   COPY public.usuarios (id, nombre_completo, correo, usuario, contrasena) FROM stdin;
    public          postgres    false    226   I2       &           0    0    clientes_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.clientes_id_seq', 1, false);
          public          postgres    false    219            '           0    0    cuentas_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.cuentas_id_seq', 1, false);
          public          postgres    false    221            (           0    0    menu_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.menu_id_seq', 1, false);
          public          postgres    false    217            )           0    0    salas_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.salas_id_seq', 1, false);
          public          postgres    false    215            *           0    0    totaldeventa_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.totaldeventa_id_seq', 1, false);
          public          postgres    false    223            +           0    0    usuarios_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.usuarios_id_seq', 1, false);
          public          postgres    false    225            t           2606    32863    clientes clientes_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    220            v           2606    32870    cuentas cuentas_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.cuentas
    ADD CONSTRAINT cuentas_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.cuentas DROP CONSTRAINT cuentas_pkey;
       public            postgres    false    222            r           2606    32856    menu menu_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.menu DROP CONSTRAINT menu_pkey;
       public            postgres    false    218            p           2606    32849    salas salas_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.salas
    ADD CONSTRAINT salas_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.salas DROP CONSTRAINT salas_pkey;
       public            postgres    false    216            x           2606    32877    totaldeventa totaldeventa_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.totaldeventa
    ADD CONSTRAINT totaldeventa_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.totaldeventa DROP CONSTRAINT totaldeventa_pkey;
       public            postgres    false    224            z           2606    32886    usuarios usuarios_correo_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_correo_key UNIQUE (correo);
 F   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_correo_key;
       public            postgres    false    226            |           2606    32884    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    226            ~           2606    32888    usuarios usuarios_usuario_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_usuario_key UNIQUE (usuario);
 G   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_usuario_key;
       public            postgres    false    226                  x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �     