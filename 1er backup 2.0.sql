PGDMP  7    (                |            restaurant_db    16.3    16.3 2               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                        0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            !           1262    32889    restaurant_db    DATABASE     �   CREATE DATABASE restaurant_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE restaurant_db;
                postgres    false            �            1259    32892    clientes    TABLE     n   CREATE TABLE public.clientes (
    id_cliente integer NOT NULL,
    nombre character varying(100) NOT NULL
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    32891    clientes_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.clientes_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.clientes_id_cliente_seq;
       public          postgres    false    216            "           0    0    clientes_id_cliente_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.clientes_id_cliente_seq OWNED BY public.clientes.id_cliente;
          public          postgres    false    215            �            1259    32899    cuentas    TABLE     �   CREATE TABLE public.cuentas (
    id_cuenta integer NOT NULL,
    id_cliente integer,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    total numeric(10,2) NOT NULL,
    estado character varying(50) NOT NULL
);
    DROP TABLE public.cuentas;
       public         heap    postgres    false            �            1259    32898    cuentas_id_cuenta_seq    SEQUENCE     �   CREATE SEQUENCE public.cuentas_id_cuenta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.cuentas_id_cuenta_seq;
       public          postgres    false    218            #           0    0    cuentas_id_cuenta_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.cuentas_id_cuenta_seq OWNED BY public.cuentas.id_cuenta;
          public          postgres    false    217            �            1259    32912    menu    TABLE     �   CREATE TABLE public.menu (
    id_menu integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text,
    precio numeric(10,2) NOT NULL,
    disponibilidad boolean NOT NULL
);
    DROP TABLE public.menu;
       public         heap    postgres    false            �            1259    32911    menu_id_menu_seq    SEQUENCE     �   CREATE SEQUENCE public.menu_id_menu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.menu_id_menu_seq;
       public          postgres    false    220            $           0    0    menu_id_menu_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.menu_id_menu_seq OWNED BY public.menu.id_menu;
          public          postgres    false    219            �            1259    32921    mesas    TABLE     �   CREATE TABLE public.mesas (
    id_mesa integer NOT NULL,
    capacidad integer NOT NULL,
    estado character varying(50) NOT NULL,
    id_cliente integer
);
    DROP TABLE public.mesas;
       public         heap    postgres    false            �            1259    32920    mesas_id_mesa_seq    SEQUENCE     �   CREATE SEQUENCE public.mesas_id_mesa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.mesas_id_mesa_seq;
       public          postgres    false    222            %           0    0    mesas_id_mesa_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.mesas_id_mesa_seq OWNED BY public.mesas.id_mesa;
          public          postgres    false    221            �            1259    32933    totaldeventa    TABLE     }   CREATE TABLE public.totaldeventa (
    id_venta integer NOT NULL,
    id_cuenta integer,
    total numeric(10,2) NOT NULL
);
     DROP TABLE public.totaldeventa;
       public         heap    postgres    false            �            1259    32932    totaldeventa_id_venta_seq    SEQUENCE     �   CREATE SEQUENCE public.totaldeventa_id_venta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.totaldeventa_id_venta_seq;
       public          postgres    false    224            &           0    0    totaldeventa_id_venta_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.totaldeventa_id_venta_seq OWNED BY public.totaldeventa.id_venta;
          public          postgres    false    223            �            1259    32945    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nombre character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    rol character varying(50) NOT NULL,
    "contraseña" character varying(255) NOT NULL
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            �            1259    32944    usuarios_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.usuarios_id_usuario_seq;
       public          postgres    false    226            '           0    0    usuarios_id_usuario_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;
          public          postgres    false    225            i           2604    32895    clientes id_cliente    DEFAULT     z   ALTER TABLE ONLY public.clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.clientes_id_cliente_seq'::regclass);
 B   ALTER TABLE public.clientes ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    215    216    216            j           2604    32902    cuentas id_cuenta    DEFAULT     v   ALTER TABLE ONLY public.cuentas ALTER COLUMN id_cuenta SET DEFAULT nextval('public.cuentas_id_cuenta_seq'::regclass);
 @   ALTER TABLE public.cuentas ALTER COLUMN id_cuenta DROP DEFAULT;
       public          postgres    false    218    217    218            l           2604    32915    menu id_menu    DEFAULT     l   ALTER TABLE ONLY public.menu ALTER COLUMN id_menu SET DEFAULT nextval('public.menu_id_menu_seq'::regclass);
 ;   ALTER TABLE public.menu ALTER COLUMN id_menu DROP DEFAULT;
       public          postgres    false    220    219    220            m           2604    32924    mesas id_mesa    DEFAULT     n   ALTER TABLE ONLY public.mesas ALTER COLUMN id_mesa SET DEFAULT nextval('public.mesas_id_mesa_seq'::regclass);
 <   ALTER TABLE public.mesas ALTER COLUMN id_mesa DROP DEFAULT;
       public          postgres    false    221    222    222            n           2604    32936    totaldeventa id_venta    DEFAULT     ~   ALTER TABLE ONLY public.totaldeventa ALTER COLUMN id_venta SET DEFAULT nextval('public.totaldeventa_id_venta_seq'::regclass);
 D   ALTER TABLE public.totaldeventa ALTER COLUMN id_venta DROP DEFAULT;
       public          postgres    false    224    223    224            o           2604    32948    usuarios id_usuario    DEFAULT     z   ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);
 B   ALTER TABLE public.usuarios ALTER COLUMN id_usuario DROP DEFAULT;
       public          postgres    false    226    225    226                      0    32892    clientes 
   TABLE DATA           6   COPY public.clientes (id_cliente, nombre) FROM stdin;
    public          postgres    false    216   R8                 0    32899    cuentas 
   TABLE DATA           N   COPY public.cuentas (id_cuenta, id_cliente, fecha, total, estado) FROM stdin;
    public          postgres    false    218   o8                 0    32912    menu 
   TABLE DATA           T   COPY public.menu (id_menu, nombre, descripcion, precio, disponibilidad) FROM stdin;
    public          postgres    false    220   �8                 0    32921    mesas 
   TABLE DATA           G   COPY public.mesas (id_mesa, capacidad, estado, id_cliente) FROM stdin;
    public          postgres    false    222   �8                 0    32933    totaldeventa 
   TABLE DATA           B   COPY public.totaldeventa (id_venta, id_cuenta, total) FROM stdin;
    public          postgres    false    224   �8                 0    32945    usuarios 
   TABLE DATA           Q   COPY public.usuarios (id_usuario, nombre, email, rol, "contraseña") FROM stdin;
    public          postgres    false    226   �8       (           0    0    clientes_id_cliente_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.clientes_id_cliente_seq', 1, false);
          public          postgres    false    215            )           0    0    cuentas_id_cuenta_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.cuentas_id_cuenta_seq', 1, false);
          public          postgres    false    217            *           0    0    menu_id_menu_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.menu_id_menu_seq', 1, false);
          public          postgres    false    219            +           0    0    mesas_id_mesa_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.mesas_id_mesa_seq', 1, false);
          public          postgres    false    221            ,           0    0    totaldeventa_id_venta_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.totaldeventa_id_venta_seq', 1, false);
          public          postgres    false    223            -           0    0    usuarios_id_usuario_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 1, false);
          public          postgres    false    225            q           2606    32897    clientes clientes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    216            s           2606    32905    cuentas cuentas_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.cuentas
    ADD CONSTRAINT cuentas_pkey PRIMARY KEY (id_cuenta);
 >   ALTER TABLE ONLY public.cuentas DROP CONSTRAINT cuentas_pkey;
       public            postgres    false    218            u           2606    32919    menu menu_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id_menu);
 8   ALTER TABLE ONLY public.menu DROP CONSTRAINT menu_pkey;
       public            postgres    false    220            w           2606    32926    mesas mesas_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.mesas
    ADD CONSTRAINT mesas_pkey PRIMARY KEY (id_mesa);
 :   ALTER TABLE ONLY public.mesas DROP CONSTRAINT mesas_pkey;
       public            postgres    false    222            y           2606    32938    totaldeventa totaldeventa_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.totaldeventa
    ADD CONSTRAINT totaldeventa_pkey PRIMARY KEY (id_venta);
 H   ALTER TABLE ONLY public.totaldeventa DROP CONSTRAINT totaldeventa_pkey;
       public            postgres    false    224            {           2606    32954    usuarios usuarios_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_email_key;
       public            postgres    false    226            }           2606    32952    usuarios usuarios_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    226            ~           2606    32906    cuentas cuentas_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cuentas
    ADD CONSTRAINT cuentas_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.cuentas DROP CONSTRAINT cuentas_id_cliente_fkey;
       public          postgres    false    216    218    4721                       2606    32927    mesas mesas_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.mesas
    ADD CONSTRAINT mesas_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente) ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.mesas DROP CONSTRAINT mesas_id_cliente_fkey;
       public          postgres    false    216    222    4721            �           2606    32939 (   totaldeventa totaldeventa_id_cuenta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.totaldeventa
    ADD CONSTRAINT totaldeventa_id_cuenta_fkey FOREIGN KEY (id_cuenta) REFERENCES public.cuentas(id_cuenta) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.totaldeventa DROP CONSTRAINT totaldeventa_id_cuenta_fkey;
       public          postgres    false    4723    218    224                  x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �     