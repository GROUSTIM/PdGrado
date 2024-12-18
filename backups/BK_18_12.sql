PGDMP      1    
            |            Dataex    17.0    17.0 9    ,           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            -           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            .           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            /           1262    16478    Dataex    DATABASE     }   CREATE DATABASE "Dataex" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Ecuador.1252';
    DROP DATABASE "Dataex";
                     postgres    false            �            1255    16508    notify_messenger_messages()    FUNCTION     �   CREATE FUNCTION public.notify_messenger_messages() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
            BEGIN
                PERFORM pg_notify('messenger_messages', NEW.queue_name::text);
                RETURN NEW;
            END;
        $$;
 2   DROP FUNCTION public.notify_messenger_messages();
       public               postgres    false            �            1259    16479    doctrine_migration_versions    TABLE     �   CREATE TABLE public.doctrine_migration_versions (
    version character varying(191) NOT NULL,
    executed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    execution_time integer
);
 /   DROP TABLE public.doctrine_migration_versions;
       public         heap r       postgres    false            �            1259    16496    messenger_messages    TABLE     s  CREATE TABLE public.messenger_messages (
    id bigint NOT NULL,
    body text NOT NULL,
    headers text NOT NULL,
    queue_name character varying(190) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    available_at timestamp(0) without time zone NOT NULL,
    delivered_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);
 &   DROP TABLE public.messenger_messages;
       public         heap r       postgres    false            0           0    0 $   COLUMN messenger_messages.created_at    COMMENT     Z   COMMENT ON COLUMN public.messenger_messages.created_at IS '(DC2Type:datetime_immutable)';
          public               postgres    false    221            1           0    0 &   COLUMN messenger_messages.available_at    COMMENT     \   COMMENT ON COLUMN public.messenger_messages.available_at IS '(DC2Type:datetime_immutable)';
          public               postgres    false    221            2           0    0 &   COLUMN messenger_messages.delivered_at    COMMENT     \   COMMENT ON COLUMN public.messenger_messages.delivered_at IS '(DC2Type:datetime_immutable)';
          public               postgres    false    221            �            1259    16495    messenger_messages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.messenger_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.messenger_messages_id_seq;
       public               postgres    false    221            3           0    0    messenger_messages_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.messenger_messages_id_seq OWNED BY public.messenger_messages.id;
          public               postgres    false    220            �            1259    16527    persona    TABLE     �   CREATE TABLE public.persona (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    sexo character varying(50) NOT NULL,
    edad integer NOT NULL
);
    DROP TABLE public.persona;
       public         heap r       postgres    false            �            1259    16526    persona_id_seq    SEQUENCE     �   CREATE SEQUENCE public.persona_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.persona_id_seq;
       public               postgres    false    223            4           0    0    persona_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.persona_id_seq OWNED BY public.persona.id;
          public               postgres    false    222            �            1259    16534    roles    TABLE     c   CREATE TABLE public.roles (
    id integer NOT NULL,
    nombres character varying(50) NOT NULL
);
    DROP TABLE public.roles;
       public         heap r       postgres    false            �            1259    16533    roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public               postgres    false    225            5           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public               postgres    false    224            �            1259    16486    user    TABLE     �   CREATE TABLE public."user" (
    id integer NOT NULL,
    email character varying(180) NOT NULL,
    roles json NOT NULL,
    password character varying(255) NOT NULL,
    person_id integer NOT NULL
);
    DROP TABLE public."user";
       public         heap r       postgres    false            �            1259    16485    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public               postgres    false    219            6           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public               postgres    false    218            �            1259    24671 
   user_roles    TABLE     h   CREATE TABLE public.user_roles (
    id integer NOT NULL,
    users_id integer,
    roles_id integer
);
    DROP TABLE public.user_roles;
       public         heap r       postgres    false            �            1259    24670    user_roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.user_roles_id_seq;
       public               postgres    false    227            7           0    0    user_roles_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.user_roles_id_seq OWNED BY public.user_roles.id;
          public               postgres    false    226            r           2604    16499    messenger_messages id    DEFAULT     ~   ALTER TABLE ONLY public.messenger_messages ALTER COLUMN id SET DEFAULT nextval('public.messenger_messages_id_seq'::regclass);
 D   ALTER TABLE public.messenger_messages ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    220    221            t           2604    16530 
   persona id    DEFAULT     h   ALTER TABLE ONLY public.persona ALTER COLUMN id SET DEFAULT nextval('public.persona_id_seq'::regclass);
 9   ALTER TABLE public.persona ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    223    223            u           2604    16537    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    225    224    225            q           2604    16489    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    218    219    219            v           2604    24674    user_roles id    DEFAULT     n   ALTER TABLE ONLY public.user_roles ALTER COLUMN id SET DEFAULT nextval('public.user_roles_id_seq'::regclass);
 <   ALTER TABLE public.user_roles ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    227    226    227                      0    16479    doctrine_migration_versions 
   TABLE DATA           [   COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
    public               postgres    false    217   A       #          0    16496    messenger_messages 
   TABLE DATA           s   COPY public.messenger_messages (id, body, headers, queue_name, created_at, available_at, delivered_at) FROM stdin;
    public               postgres    false    221   �A       %          0    16527    persona 
   TABLE DATA           C   COPY public.persona (id, nombre, apellido, sexo, edad) FROM stdin;
    public               postgres    false    223   �A       '          0    16534    roles 
   TABLE DATA           ,   COPY public.roles (id, nombres) FROM stdin;
    public               postgres    false    225   HB       !          0    16486    user 
   TABLE DATA           G   COPY public."user" (id, email, roles, password, person_id) FROM stdin;
    public               postgres    false    219   }B       )          0    24671 
   user_roles 
   TABLE DATA           <   COPY public.user_roles (id, users_id, roles_id) FROM stdin;
    public               postgres    false    227   [C       8           0    0    messenger_messages_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.messenger_messages_id_seq', 1, false);
          public               postgres    false    220            9           0    0    persona_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.persona_id_seq', 3, true);
          public               postgres    false    222            :           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 6, true);
          public               postgres    false    224            ;           0    0    user_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.user_id_seq', 5, true);
          public               postgres    false    218            <           0    0    user_roles_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.user_roles_id_seq', 3, true);
          public               postgres    false    226            x           2606    16484 <   doctrine_migration_versions doctrine_migration_versions_pkey 
   CONSTRAINT        ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);
 f   ALTER TABLE ONLY public.doctrine_migration_versions DROP CONSTRAINT doctrine_migration_versions_pkey;
       public                 postgres    false    217            �           2606    16504 *   messenger_messages messenger_messages_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.messenger_messages
    ADD CONSTRAINT messenger_messages_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.messenger_messages DROP CONSTRAINT messenger_messages_pkey;
       public                 postgres    false    221            �           2606    16532    persona persona_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.persona DROP CONSTRAINT persona_pkey;
       public                 postgres    false    223            �           2606    16539    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public                 postgres    false    225            |           2606    16493    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public                 postgres    false    219            �           2606    24676    user_roles user_roles_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_pkey;
       public                 postgres    false    227            �           1259    24678    idx_54fcd59f38c751c4    INDEX     O   CREATE INDEX idx_54fcd59f38c751c4 ON public.user_roles USING btree (roles_id);
 (   DROP INDEX public.idx_54fcd59f38c751c4;
       public                 postgres    false    227            �           1259    24677    idx_54fcd59f67b3b43d    INDEX     O   CREATE INDEX idx_54fcd59f67b3b43d ON public.user_roles USING btree (users_id);
 (   DROP INDEX public.idx_54fcd59f67b3b43d;
       public                 postgres    false    227            }           1259    16507    idx_75ea56e016ba31db    INDEX     [   CREATE INDEX idx_75ea56e016ba31db ON public.messenger_messages USING btree (delivered_at);
 (   DROP INDEX public.idx_75ea56e016ba31db;
       public                 postgres    false    221            ~           1259    16506    idx_75ea56e0e3bd61ce    INDEX     [   CREATE INDEX idx_75ea56e0e3bd61ce ON public.messenger_messages USING btree (available_at);
 (   DROP INDEX public.idx_75ea56e0e3bd61ce;
       public                 postgres    false    221                       1259    16505    idx_75ea56e0fb7336f0    INDEX     Y   CREATE INDEX idx_75ea56e0fb7336f0 ON public.messenger_messages USING btree (queue_name);
 (   DROP INDEX public.idx_75ea56e0fb7336f0;
       public                 postgres    false    221            y           1259    16570    uniq_8d93d649217bbb47    INDEX     T   CREATE UNIQUE INDEX uniq_8d93d649217bbb47 ON public."user" USING btree (person_id);
 )   DROP INDEX public.uniq_8d93d649217bbb47;
       public                 postgres    false    219            z           1259    16494    uniq_identifier_email    INDEX     P   CREATE UNIQUE INDEX uniq_identifier_email ON public."user" USING btree (email);
 )   DROP INDEX public.uniq_identifier_email;
       public                 postgres    false    219            �           2620    16509 !   messenger_messages notify_trigger    TRIGGER     �   CREATE TRIGGER notify_trigger AFTER INSERT OR UPDATE ON public.messenger_messages FOR EACH ROW EXECUTE FUNCTION public.notify_messenger_messages();
 :   DROP TRIGGER notify_trigger ON public.messenger_messages;
       public               postgres    false    221    228            �           2606    24684    user_roles fk_54fcd59f38c751c4    FK CONSTRAINT     ~   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fk_54fcd59f38c751c4 FOREIGN KEY (roles_id) REFERENCES public.roles(id);
 H   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT fk_54fcd59f38c751c4;
       public               postgres    false    4741    225    227            �           2606    24679    user_roles fk_54fcd59f67b3b43d    FK CONSTRAINT        ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fk_54fcd59f67b3b43d FOREIGN KEY (users_id) REFERENCES public."user"(id);
 H   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT fk_54fcd59f67b3b43d;
       public               postgres    false    227    4732    219            �           2606    16565    user fk_8d93d649217bbb47    FK CONSTRAINT     }   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT fk_8d93d649217bbb47 FOREIGN KEY (person_id) REFERENCES public.persona(id);
 D   ALTER TABLE ONLY public."user" DROP CONSTRAINT fk_8d93d649217bbb47;
       public               postgres    false    223    4739    219               �   x��Ͻ�0�9y
^�ʾ�)?3k�N,U��, �_����^>����Z��g���V�y����=	D)s�TwԞ�s�T�.e?���΀� ��t�d�X.��p�d���P�����{�@�"+�,����yZs      #      x������ � �      %   o   x�-�1
�@���)�B�HZQ�J$E*��8j`vv#��7H�ǫ����B�;�p旓��޴��b�U-klM���~�c�2�:��sA�l��C'�4�G*R|yT���u%"?^J#�      '   %   x�3�t-.)M�L�+I�2�(�OK-�/����� ���      !   �   x�]�Kr�0  �ur�@��1Q>��!�va ����bn�M��;�C�^�z����6�k�8�Z�uZ� �ݪc2>���9��8M��T�˳�q�Rq� "�.�|s�۝�i6b�G���$=�7�)W�����i�������1tA6�ץ�ۦ]{�m�H���*��2͹�fj=��LX�҆�O�_k�Z^L��E�      )      x�3�4�4�2�4�4�2�4�1z\\\ !��     