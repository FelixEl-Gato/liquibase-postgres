--liquibase formatted sql

--changeset tu-nombre:002-create-orders-table
--comment: Tabla de órdenes vinculada a users

CREATE TABLE public.orders (
    id          BIGSERIAL PRIMARY KEY,
    user_id     UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    total       NUMERIC(12, 2) NOT NULL CHECK (total >= 0),
    currency    CHAR(3) NOT NULL DEFAULT 'USD',
    status      VARCHAR(30) NOT NULL DEFAULT 'pending',
    created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_orders_user_id ON public.orders (user_id);
CREATE INDEX idx_orders_status  ON public.orders (status);

--rollback DROP TABLE IF EXISTS public.orders;