-- Run once in the Supabase SQL Editor after supabase_payroll.sql.
alter table public.leave_requests
add column if not exists day_fraction numeric(2,1) not null default 1
check (day_fraction in (0.5, 1));

-- Payroll totals must support fractional paid/CL/SL days.
alter table public.salary_slips
alter column cl_days type numeric(6,1) using cl_days::numeric,
alter column sl_days type numeric(6,1) using sl_days::numeric,
alter column paid_leave_days type numeric(6,1) using paid_leave_days::numeric;
