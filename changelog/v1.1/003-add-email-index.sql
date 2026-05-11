--liquibase formatted sql

--changeset tu-nombre:003-add-email-index
--comment: Índice parcial para búsquedas de usuarios activos por email

CREATE UNIQUE INDEX public.idx_users_email_active
    ON public.users (email)
    WHERE status = 'active';

--rollback DROP INDEX IF EXISTS public.idx_users_email_active;